# GENERADO por tools/generate.py - no editar a mano
# Interno: @s se puso la pechera de hierro sin tenerla desbloqueada
function wearbound:armor/kick {slot:"chest"}
title @s actionbar [{"text":""},{"text":"Aún no puedes llevar la pechera de hierro ","color":"red"},{"type":"object","object":"atlas","atlas":"minecraft:items","sprite":"item/iron_chestplate","color":"white"},{"text":". Rompe ","color":"gray"},{"text":"una pechera de cobre ","color":"yellow"},{"type":"object","object":"atlas","atlas":"minecraft:items","sprite":"item/copper_chestplate","color":"white"},{"text":" para desbloquearla.","color":"gray"}]
execute at @s run playsound minecraft:block.note_block.bass master @s ~ ~ ~ 0.8 0.6
execute unless score @s wb.acd matches 1.. run tellraw @s [{"text":""},{"text":"Aún no puedes llevar la pechera de hierro ","color":"red"},{"type":"object","object":"atlas","atlas":"minecraft:items","sprite":"item/iron_chestplate","color":"white"},{"text":". Rompe ","color":"gray"},{"text":"una pechera de cobre ","color":"yellow"},{"type":"object","object":"atlas","atlas":"minecraft:items","sprite":"item/copper_chestplate","color":"white"},{"text":" para desbloquearla.","color":"gray"}]
execute unless score @s wb.acd matches 1.. run scoreboard players set @s wb.acd 60
