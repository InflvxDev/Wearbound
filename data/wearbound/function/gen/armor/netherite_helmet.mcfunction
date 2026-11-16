# GENERADO por tools/generate.py - no editar a mano
# Interno: @s se puso el casco de netherita sin tenerlo desbloqueado
function wearbound:armor/kick {slot:"head"}
title @s actionbar [{"text":""},{"text":"Aún no puedes llevar el casco de netherita ","color":"red"},{"type":"object","object":"atlas","atlas":"minecraft:items","sprite":"item/netherite_helmet","color":"white"},{"text":". Desbloquea el tier de diamante para usarlo.","color":"gray"}]
execute at @s run playsound minecraft:block.note_block.bass master @s ~ ~ ~ 0.8 0.6
execute unless score @s wb.acd matches 1.. run tellraw @s [{"text":""},{"text":"Aún no puedes llevar el casco de netherita ","color":"red"},{"type":"object","object":"atlas","atlas":"minecraft:items","sprite":"item/netherite_helmet","color":"white"},{"text":". Desbloquea el tier de diamante para usarlo.","color":"gray"}]
execute unless score @s wb.acd matches 1.. run scoreboard players set @s wb.acd 60
