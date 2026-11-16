# GENERADO por tools/generate.py - no editar a mano
# Interno: @s se puso la pechera de netherita sin tenerla desbloqueada
function tierbreak:armor/kick {slot:"chest"}
title @s actionbar [{"text":""},{"text":"Aún no puedes llevar la pechera de netherita ","color":"red"},{"type":"object","object":"atlas","atlas":"minecraft:items","sprite":"item/netherite_chestplate","color":"white"},{"text":". Desbloquea el tier de diamante para usarla.","color":"gray"}]
execute at @s run playsound minecraft:block.note_block.bass master @s ~ ~ ~ 0.8 0.6
execute unless score @s tb.acd matches 1.. run tellraw @s [{"text":""},{"text":"Aún no puedes llevar la pechera de netherita ","color":"red"},{"type":"object","object":"atlas","atlas":"minecraft:items","sprite":"item/netherite_chestplate","color":"white"},{"text":". Desbloquea el tier de diamante para usarla.","color":"gray"}]
execute unless score @s tb.acd matches 1.. run scoreboard players set @s tb.acd 60
