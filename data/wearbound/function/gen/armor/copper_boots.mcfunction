# GENERADO por tools/generate.py - no editar a mano
# Interno: @s se puso las botas de cobre sin tenerlas desbloqueadas
function wearbound:armor/kick {slot:"feet"}
title @s actionbar [{"text":""},{"text":"Aún no puedes llevar las botas de cobre ","color":"red"},{"type":"object","object":"atlas","atlas":"minecraft:items","sprite":"item/copper_boots","color":"white"},{"text":". Rompe ","color":"gray"},{"text":"unas botas de cuero ","color":"yellow"},{"type":"object","object":"atlas","atlas":"minecraft:items","sprite":"item/leather_boots","color":"#B4774A"},{"text":" para desbloquearlas.","color":"gray"}]
execute at @s run playsound minecraft:block.note_block.bass master @s ~ ~ ~ 0.8 0.6
execute unless score @s wb.acd matches 1.. run tellraw @s [{"text":""},{"text":"Aún no puedes llevar las botas de cobre ","color":"red"},{"type":"object","object":"atlas","atlas":"minecraft:items","sprite":"item/copper_boots","color":"white"},{"text":". Rompe ","color":"gray"},{"text":"unas botas de cuero ","color":"yellow"},{"type":"object","object":"atlas","atlas":"minecraft:items","sprite":"item/leather_boots","color":"#B4774A"},{"text":" para desbloquearlas.","color":"gray"}]
execute unless score @s wb.acd matches 1.. run scoreboard players set @s wb.acd 60
