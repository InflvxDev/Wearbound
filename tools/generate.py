#!/usr/bin/env python3
"""Wearbound - generador.

Regenera todo lo repetitivo del datapack (function/gen/*, tags de ítems).
Edita las tablas de abajo y ejecuta:  python tools/generate.py
"""
import json
import os
import shutil

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
NS = os.path.join(ROOT, "data", "wearbound")
GEN = os.path.join(NS, "function", "gen")

# ---------------------------------------------------------------------------
# Tablas
# ---------------------------------------------------------------------------
# key, Nombre, artículo definido, artículo indefinido, sufijo de género/número,
# slot de armadura (None = herramienta/arma)
TOOLS = [
    ("sword", "Espada", "la", "una", "a", None),
    ("axe", "Hacha", "el", "un", "a", None),
    ("pickaxe", "Pico", "el", "un", "o", None),
    ("shovel", "Pala", "la", "una", "a", None),
    ("hoe", "Azada", "la", "una", "a", None),
    ("spear", "Lanza", "la", "una", "a", None),
]
ARMOR = [
    ("helmet", "Casco", "el", "un", "o", "head"),
    ("chestplate", "Pechera", "la", "una", "a", "chest"),
    ("leggings", "Pantalones", "los", "unos", "os", "legs"),
    ("boots", "Botas", "las", "unas", "as", "feet"),
]
# Cada tier es una lista de (prefijo del ítem, nombre del material)
TOOL_TIERS = [
    [("wooden", "madera")],
    [("stone", "piedra")],
    [("copper", "cobre")],
    [("iron", "hierro")],
    # La netherita va en el mismo tier que el diamante: no se puede usar
    # (aunque se mejore en la mesa de herrería) hasta desbloquear el diamante.
    [("diamond", "diamante"), ("netherite", "netherita")],
]
ARMOR_TIERS = [
    [("leather", "cuero")],
    [("copper", "cobre")],
    [("iron", "hierro"), ("chainmail", "cota de malla")],
    [("diamond", "diamante"), ("netherite", "netherita")],
]
MAT_COLOR = {
    "wooden": "#C29A5B", "stone": "#A8A8A8", "copper": "#E8875A", "iron": "#E4E4E4",
    "diamond": "#5DE0E6", "leather": "#B4774A", "chainmail": "#A9AFC2",
}
PRON = {"o": "lo", "a": "la", "os": "los", "as": "las"}

TYPES = [(*t, TOOL_TIERS) for t in TOOLS] + [(*t, ARMOR_TIERS) for t in ARMOR]
MAX_TOTAL = sum(len(t[6]) - 1 for t in TYPES)

# ---------------------------------------------------------------------------
# Helpers de texto
# ---------------------------------------------------------------------------


def snbt(v):
    return json.dumps(v, ensure_ascii=False, separators=(",", ":"))


def tx(text, color=None, **kw):
    c = {"text": text}
    if color:
        c["color"] = color
    c.update(kw)
    return c


def spr(item):
    """Ícono del ítem dentro del texto (sprite del atlas de ítems)."""
    c = {"type": "object", "object": "atlas", "atlas": "minecraft:items",
         "sprite": f"item/{item}", "color": "white"}
    if item.startswith("leather_"):
        c["color"] = MAT_COLOR["leather"]
    return c


R = {"text": ""}  # raíz vacía: así los íconos no heredan colores


def cap(s):
    return s[0].upper() + s[1:]


def item_id(mat, key):
    return f"{mat}_{key}"


def tier_label(tier):
    return " / ".join(cap(m) for _, m in tier)


def tier_names(key, name, tier, art):
    """'unas botas de hierro' + ícono + ' o de cota de malla' + ícono"""
    parts = []
    for j, (mat, mname) in enumerate(tier):
        if j == 0:
            parts.append(tx(f"{art} {name.lower()} de {mname} ", "yellow"))
        else:
            parts.append(tx(f" o de {mname} ", "yellow"))
        parts.append(spr(item_id(mat, key)))
    return parts


def write(path, lines):
    path = os.path.join(NS, path)
    os.makedirs(os.path.dirname(path), exist_ok=True)
    with open(path, "w", encoding="utf-8", newline="\n") as f:
        f.write("\n".join(lines) + "\n")


def write_json(path, data):
    path = os.path.join(NS, path)
    os.makedirs(os.path.dirname(path), exist_ok=True)
    with open(path, "w", encoding="utf-8", newline="\n") as f:
        json.dump(data, f, ensure_ascii=False, indent=2)
        f.write("\n")


# ---------------------------------------------------------------------------
# Generación
# ---------------------------------------------------------------------------
# Vacía gen/ (sin borrar la carpeta, por si el editor la tiene abierta)
if os.path.isdir(GEN):
    for entry in os.listdir(GEN):
        target = os.path.join(GEN, entry)
        shutil.rmtree(target) if os.path.isdir(target) else os.remove(target)

HDR = "# GENERADO por tools/generate.py - no editar a mano"

objectives = [HDR]
init = [HDR, "# Interno: deja en 0 los tiers que @s todavía no tenga"]
breaks = [HDR, "# Interno: @s rompió algo -> desbloquea el tier siguiente de ese tipo"]
hand = [HDR, "# Interno: si @s tiene en la mano algo bloqueado, gen/msg/* pone #lk wb.calc en 1 y avisa",
        "# Primero la mano principal, después la secundaria"]
hand_off = []
armor = [HDR, "# Interno: devuelve al inventario la armadura que @s todavía no puede llevar"]
gated_tools, gated_armor = [], []
uninstall = [HDR]
total = [HDR, "# Interno: #v wb.calc = tiers desbloqueados en total por el jugador $(n)",
         "scoreboard players set #v wb.calc 0"]
row_icons = [HDR, "# Interno: lee los tiers de $(n) para la fila del ranking"]
row_icons_add = [HDR, "# Interno: agrega los íconos de cada tipo a la fila"]
detail = [HDR, "# Interno: lee los tiers de $(n) para el detalle"]
detail_add = [HDR, "# Interno: agrega un ítem por tipo al detalle"]
set_all = [HDR, "# Interno: {n, t, a} pone todas las herramientas/armas en el tier t y la armadura en a"]

db = {"icons": {}, "detail": {}, "pads": [" " + "." * k for k in range(41)]}

for ti, (key, name, art, indef, suf, slot, tiers) in enumerate(TYPES):
    is_armor = slot is not None
    obj = f"wb.{key}"
    top = len(tiers) - 1
    verb = "llevar" if is_armor else "usar"
    objectives.append(f'scoreboard objectives add {obj} dummy "Wearbound · {name}"')
    init.append(f"scoreboard players add @s {obj} 0")
    uninstall.append(f"scoreboard objectives remove {obj}")
    total.append(f"$execute store result score #x wb.calc run scoreboard players get $(n) {obj}")
    total.append("scoreboard players operation #v wb.calc += #x wb.calc")
    row_icons.append(f"$execute store result storage wearbound:tmp ic.{key} int 1 run scoreboard players get $(n) {obj}")
    detail.append(f"$execute store result storage wearbound:tmp ic.{key} int 1 run scoreboard players get $(n) {obj}")
    if key == "helmet":
        row_icons_add.append('data modify storage wearbound:tmp line.contents.extra append value {text:"  "}')
        detail_add.append('data modify storage wearbound:tmp ui.body append value {type:"minecraft:plain_message",width:300,contents:{text:"Armadura",color:"gold",bold:true}}')
    if key == "sword":
        detail_add.append('data modify storage wearbound:tmp ui.body append value {type:"minecraft:plain_message",width:300,contents:{text:"Herramientas y armas",color:"gold",bold:true}}')
    row_icons_add.append(f"$data modify storage wearbound:tmp line.contents.extra append from storage wearbound:db icons.{key}[$({key})]")
    detail_add.append(f"$data modify storage wearbound:tmp ui.body append from storage wearbound:db detail.{key}[$({key})]")
    set_all.append(f"$scoreboard players set $(n) {obj} $({'a' if is_armor else 't'})")

    # --- db: íconos de la fila y elementos del detalle, uno por tier ---
    icons, details = [], []
    for i, tier in enumerate(tiers):
        mat0 = tier[0][0]
        hover = [R, tx(f"{name}: ", "white"), tx(tier_label(tier), MAT_COLOR[mat0]),
                 tx(f"  ({i + 1}/{top + 1})", "gray")]
        icons.append({"text": "", "hover_event": {"action": "show_text", "value": hover},
                      "extra": [spr(item_id(mat0, key)), {"text": " "}]})
        desc = [R, tx(f"{name}: ", "white", bold=True), tx(tier_label(tier), MAT_COLOR[mat0], bold=True),
                tx(f"  ({i + 1}/{top + 1})", "gray"), tx("\n")]
        if i < top:
            desc.append(tx(f"Siguiente: romper {indef} {name.lower()} de "
                           + " o de ".join(m for _, m in tier), "gray"))
        else:
            desc.append(tx("Tier máximo", "green"))
        details.append({"type": "minecraft:item", "item": {"id": f"minecraft:{item_id(mat0, key)}"},
                        "show_decoration": False, "width": 16, "height": 16,
                        "description": {"contents": desc, "width": 300}})
    db["icons"][key] = icons
    db["detail"][key] = details

    # --- roturas: romper un ítem del tier i desbloquea el tier i+1 ---
    for i, tier in enumerate(tiers[:-1]):
        nxt = tiers[i + 1]
        for mat, mname in tier:
            it = item_id(mat, key)
            bobj = f"wb.b.{it}"
            objectives.append(f"scoreboard objectives add {bobj} minecraft.broken:minecraft.{it}")
            uninstall.append(f"scoreboard objectives remove {bobj}")
            breaks.append(f"execute if score @s {bobj} matches 1.. run function wearbound:gen/unlock/{it}")
            msg = [R, tx("¡Nuevo tier! ", "gold", bold=True), tx(f"Ya puedes {verb} ", "green")]
            for j, (nmat, nname) in enumerate(nxt):
                msg.append(tx(f"{art} {name.lower()} de {nname} " if j == 0 else f" y de {nname} ", "white"))
                msg.append(spr(item_id(nmat, key)))
            if i + 1 < top:
                msg.append(tx(". Siguiente: rompe ", "gray"))
                msg += tier_names(key, name, nxt, indef)
                msg.append(tx(".", "gray"))
            else:
                msg.append(tx(". Es el tier máximo.", "aqua"))
            write(f"function/gen/unlock/{it}.mcfunction", [
                HDR,
                f"# Interno: @s rompió {indef} {name.lower()} de {mname}",
                f"scoreboard players set @s {bobj} 0",
                f"execute if score @s {obj} matches {i + 1}.. run return 0",
                f"scoreboard players set @s {obj} {i + 1}",
                f"tellraw @s {snbt(msg)}",
                "execute at @s run playsound minecraft:entity.player.levelup master @s ~ ~ ~ 0.8 1.2",
            ])

    # --- bloqueos: ítems de tier >= 1 ---
    for i, tier in enumerate(tiers[1:], start=1):
        prev = tiers[i - 1]
        for mat, mname in tier:
            it = item_id(mat, key)
            pron = PRON[suf]
            lock = [R, tx(f"Aún no puedes {verb} {art} {name.lower()} de {mname} ", "red"),
                    spr(it), tx(". Rompe ", "gray"), *tier_names(key, name, prev, indef),
                    tx(f" para desbloquear{pron}.", "gray")]
            if mat == "netherite":
                lock = [R, tx(f"Aún no puedes {verb} {art} {name.lower()} de {mname} ", "red"), spr(it),
                        tx(f". Desbloquea el tier de diamante para usar{pron}.", "gray")]
            if not is_armor:
                gated_tools.append(f"minecraft:{it}")
                hand.append(f"execute if items entity @s weapon.mainhand minecraft:{it} unless score @s {obj} matches {i}.. run function wearbound:gen/msg/{it}")
                hand_off.append(f"execute if items entity @s weapon.offhand minecraft:{it} unless score @s {obj} matches {i}.. run function wearbound:gen/msg/{it}")
                write(f"function/gen/msg/{it}.mcfunction", [
                    HDR,
                    f"# Interno: {art} {name.lower()} de {mname} está bloquead{suf} -> marca #lk y avisa (cada 2 s)",
                    "scoreboard players set #lk wb.calc 1",
                    f"execute unless score @s wb.cd matches 1.. run title @s actionbar {snbt(lock)}",
                    "execute unless score @s wb.cd matches 1.. run scoreboard players set @s wb.cd 40",
                ])
            else:
                gated_armor.append(f"minecraft:{it}")
                armor.append(f"execute if items entity @s armor.{slot} minecraft:{it} unless score @s {obj} matches {i}.. run function wearbound:gen/armor/{it}")
                write(f"function/gen/armor/{it}.mcfunction", [
                    HDR,
                    f"# Interno: @s se puso {art} {name.lower()} de {mname} sin tenerl{suf} desbloquead{suf}",
                    f'function wearbound:armor/kick {{slot:"{slot}"}}',
                    f"title @s actionbar {snbt(lock)}",
                    "execute at @s run playsound minecraft:block.note_block.bass master @s ~ ~ ~ 0.8 0.6",
                    f"execute unless score @s wb.acd matches 1.. run tellraw @s {snbt(lock)}",
                    "execute unless score @s wb.acd matches 1.. run scoreboard players set @s wb.acd 60",
                ])

hand += hand_off
row_icons.append("function wearbound:gen/row_icons_add with storage wearbound:tmp ic")
detail.append("function wearbound:gen/detail_add with storage wearbound:tmp ic")

# Mensaje de bienvenida con los íconos de la progresión
arrow = tx(" > ", "dark_gray")
tool_line = [R, tx(" - ", "dark_gray"), tx("Herramientas y armas: ", "white")]
for i, tier in enumerate(TOOL_TIERS):
    tool_line += ([arrow] if i else []) + [spr(f"{tier[0][0]}_pickaxe")]
armor_line = [R, tx(" - ", "dark_gray"), tx("Armadura (pieza por pieza): ", "white")]
for i, tier in enumerate(ARMOR_TIERS):
    armor_line += ([arrow] if i else [])
    for j, (mat, _) in enumerate(m for m in tier if m[0] != "netherite"):
        armor_line += ([tx("/", "dark_gray")] if j else []) + [spr(f"{mat}_chestplate")]
welcome = [
    HDR,
    "# Interno: explicación que ve el jugador al elegir la progresión Wearbound",
    "tellraw @s " + snbt([R, tx("Elegiste ", "gray"), tx("Wearbound", "gold", bold=True), tx(". Así funciona:", "gray")]),
    "tellraw @s " + snbt(tool_line),
    "tellraw @s " + snbt(armor_line),
    "tellraw @s " + snbt([R, tx(" - ", "dark_gray"), tx("Para usar un material tienes que ", "gray"),
                          tx("romper", "red", bold=True),
                          tx(" uno del material anterior y del mismo tipo (pico para pico, botas para botas...).", "gray")]),
    "tellraw @s " + snbt([R, tx(" - ", "dark_gray"), tx("Oro", "gold"), tx(" no tiene restricciones. La ", "gray"),
                          tx("netherita", "dark_purple"), tx(" necesita el tier de diamante del mismo tipo.", "gray")]),
]

# Progresión vanilla: todos los tipos en su tier máximo para @s
max_self = [HDR, "# Interno: desbloquea todos los tiers de @s (progresión vanilla)"]
for key, *_rest, tiers in TYPES:
    max_self.append(f"scoreboard players set @s wb.{key} {len(tiers) - 1}")

# Diálogo de la primera vez: Wearbound o vanilla
icons_tools = []
for i, tier in enumerate(TOOL_TIERS):
    icons_tools += ([arrow] if i else []) + [spr(f"{tier[0][0]}_pickaxe")]
icons_armor = []
for i, tier in enumerate(ARMOR_TIERS):
    icons_armor += ([arrow] if i else [])
    for j, (mat, _) in enumerate(m for m in tier if m[0] != "netherite"):
        icons_armor += ([tx("/", "dark_gray")] if j else []) + [spr(f"{mat}_chestplate")]
choose = {
    "type": "minecraft:multi_action",
    "title": {"text": "Wearbound", "color": "gold", "bold": True},
    "body": [
        {"type": "minecraft:plain_message", "width": 320, "contents": [
            R, tx("¿Qué tipo de progresión quieres en este mundo?", "white"),
            tx(" Solo se pregunta esta vez.", "gray")]},
        {"type": "minecraft:plain_message", "width": 320, "contents": [
            R, tx("Wearbound", "gold", bold=True),
            tx(": para usar un material primero tienes que romper uno del material anterior, "
               "del mismo tipo (pico para pico, botas para botas).", "gray"),
            tx("\n"), *icons_tools, tx("\n"), *icons_armor]},
        {"type": "minecraft:plain_message", "width": 320, "contents": [
            R, tx("Vanilla", "green", bold=True),
            tx(": todo el equipo desbloqueado desde el principio, como en el juego normal.", "gray")]},
        {"type": "minecraft:plain_message", "width": 320, "contents": [
            R, tx("Después solo un admin puede cambiarlo.", "dark_gray", italic=True)]},
    ],
    "columns": 2,
    "pause": False,
    "can_close_with_escape": False,
    "after_action": "close",
    "actions": [
        {"label": {"text": "Wearbound", "color": "gold"},
         "tooltip": {"text": "Romper el equipo para subir de tier"},
         "action": {"type": "minecraft:run_command", "command": "trigger wb.pick set 1"}},
        {"label": {"text": "Vanilla", "color": "green"},
         "tooltip": {"text": "Todo desbloqueado desde el principio"},
         "action": {"type": "minecraft:run_command", "command": "trigger wb.pick set 2"}},
    ],
}
write_json("dialog/choose.json", choose)
write("function/gen/max_self.mcfunction", max_self)

write("function/gen/objectives.mcfunction", objectives)
write("function/gen/init.mcfunction", init)
write("function/gen/breaks.mcfunction", breaks)
write("function/gen/hand_check.mcfunction", hand)
write("function/gen/armor_check.mcfunction", armor)
write("function/gen/uninstall.mcfunction", uninstall)
write("function/gen/total.mcfunction", total)
write("function/gen/row_icons.mcfunction", row_icons)
write("function/gen/row_icons_add.mcfunction", row_icons_add)
write("function/gen/detail.mcfunction", detail)
write("function/gen/detail_add.mcfunction", detail_add)
write("function/gen/set_all.mcfunction", set_all)
write("function/gen/welcome.mcfunction", welcome)
write("function/gen/db.mcfunction", [HDR, f"data modify storage wearbound:db max set value {MAX_TOTAL}"]
      + [f"data modify storage wearbound:db {k} set value {snbt(v)}" for k, v in db.items()])
write_json("tags/item/gated_tools.json", {"values": gated_tools})
write_json("tags/item/gated_armor.json", {"values": gated_armor})

print(f"OK: {len(TYPES)} tipos, {len(gated_tools)} herramientas/armas y {len(gated_armor)} armaduras con bloqueo, "
      f"progreso máximo {MAX_TOTAL}.")
