# GENERADO por tools/generate.py - no editar a mano
# Interno: @s se puso los pantalones de netherita sin tenerlos desbloqueados
function wearbound:armor/kick {slot:"legs"}
title @s actionbar [{"text":""},{"text":"Aún no puedes llevar los pantalones de netherita ","color":"red"},{"type":"object","object":"atlas","atlas":"minecraft:items","sprite":"item/netherite_leggings","color":"white"},{"text":". Desbloquea el tier de diamante para usarlos.","color":"gray"}]
execute at @s run playsound minecraft:block.note_block.bass master @s ~ ~ ~ 0.8 0.6
execute unless score @s wb.acd matches 1.. run tellraw @s [{"text":""},{"text":"Aún no puedes llevar los pantalones de netherita ","color":"red"},{"type":"object","object":"atlas","atlas":"minecraft:items","sprite":"item/netherite_leggings","color":"white"},{"text":". Desbloquea el tier de diamante para usarlos.","color":"gray"}]
execute unless score @s wb.acd matches 1.. run scoreboard players set @s wb.acd 60
