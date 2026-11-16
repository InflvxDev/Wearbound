# GENERADO por tools/generate.py - no editar a mano
# Interno: @s se puso el casco de hierro sin tenerlo desbloqueado
function wearbound:armor/kick {slot:"head"}
title @s actionbar [{"text":""},{"text":"Aún no puedes llevar el casco de hierro ","color":"red"},{"type":"object","object":"atlas","atlas":"minecraft:items","sprite":"item/iron_helmet","color":"white"},{"text":". Rompe ","color":"gray"},{"text":"un casco de cobre ","color":"yellow"},{"type":"object","object":"atlas","atlas":"minecraft:items","sprite":"item/copper_helmet","color":"white"},{"text":" para desbloquearlo.","color":"gray"}]
execute at @s run playsound minecraft:block.note_block.bass master @s ~ ~ ~ 0.8 0.6
execute unless score @s wb.acd matches 1.. run tellraw @s [{"text":""},{"text":"Aún no puedes llevar el casco de hierro ","color":"red"},{"type":"object","object":"atlas","atlas":"minecraft:items","sprite":"item/iron_helmet","color":"white"},{"text":". Rompe ","color":"gray"},{"text":"un casco de cobre ","color":"yellow"},{"type":"object","object":"atlas","atlas":"minecraft:items","sprite":"item/copper_helmet","color":"white"},{"text":" para desbloquearlo.","color":"gray"}]
execute unless score @s wb.acd matches 1.. run scoreboard players set @s wb.acd 60
