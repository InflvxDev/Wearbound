# GENERADO por tools/generate.py - no editar a mano
# Interno: lee los tiers de $(n) para el detalle
$execute store result storage tierbreak:tmp ic.sword int 1 run scoreboard players get $(n) tb.sword
$execute store result storage tierbreak:tmp ic.axe int 1 run scoreboard players get $(n) tb.axe
$execute store result storage tierbreak:tmp ic.pickaxe int 1 run scoreboard players get $(n) tb.pickaxe
$execute store result storage tierbreak:tmp ic.shovel int 1 run scoreboard players get $(n) tb.shovel
$execute store result storage tierbreak:tmp ic.hoe int 1 run scoreboard players get $(n) tb.hoe
$execute store result storage tierbreak:tmp ic.spear int 1 run scoreboard players get $(n) tb.spear
$execute store result storage tierbreak:tmp ic.helmet int 1 run scoreboard players get $(n) tb.helmet
$execute store result storage tierbreak:tmp ic.chestplate int 1 run scoreboard players get $(n) tb.chestplate
$execute store result storage tierbreak:tmp ic.leggings int 1 run scoreboard players get $(n) tb.leggings
$execute store result storage tierbreak:tmp ic.boots int 1 run scoreboard players get $(n) tb.boots
function tierbreak:gen/detail_add with storage tierbreak:tmp ic
