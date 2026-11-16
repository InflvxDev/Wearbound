# GENERADO por tools/generate.py - no editar a mano
# Interno: lee los tiers de $(n) para la fila del ranking
$execute store result storage wearbound:tmp ic.sword int 1 run scoreboard players get $(n) wb.sword
$execute store result storage wearbound:tmp ic.axe int 1 run scoreboard players get $(n) wb.axe
$execute store result storage wearbound:tmp ic.pickaxe int 1 run scoreboard players get $(n) wb.pickaxe
$execute store result storage wearbound:tmp ic.shovel int 1 run scoreboard players get $(n) wb.shovel
$execute store result storage wearbound:tmp ic.hoe int 1 run scoreboard players get $(n) wb.hoe
$execute store result storage wearbound:tmp ic.spear int 1 run scoreboard players get $(n) wb.spear
$execute store result storage wearbound:tmp ic.helmet int 1 run scoreboard players get $(n) wb.helmet
$execute store result storage wearbound:tmp ic.chestplate int 1 run scoreboard players get $(n) wb.chestplate
$execute store result storage wearbound:tmp ic.leggings int 1 run scoreboard players get $(n) wb.leggings
$execute store result storage wearbound:tmp ic.boots int 1 run scoreboard players get $(n) wb.boots
function wearbound:gen/row_icons_add with storage wearbound:tmp ic
