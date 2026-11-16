# GENERADO por tools/generate.py - no editar a mano
# Interno: #v wb.calc = tiers desbloqueados en total por el jugador $(n)
scoreboard players set #v wb.calc 0
$execute store result score #x wb.calc run scoreboard players get $(n) wb.sword
scoreboard players operation #v wb.calc += #x wb.calc
$execute store result score #x wb.calc run scoreboard players get $(n) wb.axe
scoreboard players operation #v wb.calc += #x wb.calc
$execute store result score #x wb.calc run scoreboard players get $(n) wb.pickaxe
scoreboard players operation #v wb.calc += #x wb.calc
$execute store result score #x wb.calc run scoreboard players get $(n) wb.shovel
scoreboard players operation #v wb.calc += #x wb.calc
$execute store result score #x wb.calc run scoreboard players get $(n) wb.hoe
scoreboard players operation #v wb.calc += #x wb.calc
$execute store result score #x wb.calc run scoreboard players get $(n) wb.spear
scoreboard players operation #v wb.calc += #x wb.calc
$execute store result score #x wb.calc run scoreboard players get $(n) wb.helmet
scoreboard players operation #v wb.calc += #x wb.calc
$execute store result score #x wb.calc run scoreboard players get $(n) wb.chestplate
scoreboard players operation #v wb.calc += #x wb.calc
$execute store result score #x wb.calc run scoreboard players get $(n) wb.leggings
scoreboard players operation #v wb.calc += #x wb.calc
$execute store result score #x wb.calc run scoreboard players get $(n) wb.boots
scoreboard players operation #v wb.calc += #x wb.calc
