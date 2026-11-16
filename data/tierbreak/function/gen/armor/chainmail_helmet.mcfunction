# GENERADO por tools/generate.py - no editar a mano
# Interno: @s se puso el casco de cota de malla sin tenerlo desbloqueado
function tierbreak:armor/kick {slot:"head"}
title @s actionbar [{"text":""},{"text":"Aún no puedes llevar el casco de cota de malla ","color":"red"},{"type":"object","object":"atlas","atlas":"minecraft:items","sprite":"item/chainmail_helmet","color":"white"},{"text":". Rompe ","color":"gray"},{"text":"un casco de cobre ","color":"yellow"},{"type":"object","object":"atlas","atlas":"minecraft:items","sprite":"item/copper_helmet","color":"white"},{"text":" para desbloquearlo.","color":"gray"}]
execute at @s run playsound minecraft:block.note_block.bass master @s ~ ~ ~ 0.8 0.6
execute unless score @s tb.acd matches 1.. run tellraw @s [{"text":""},{"text":"Aún no puedes llevar el casco de cota de malla ","color":"red"},{"type":"object","object":"atlas","atlas":"minecraft:items","sprite":"item/chainmail_helmet","color":"white"},{"text":". Rompe ","color":"gray"},{"text":"un casco de cobre ","color":"yellow"},{"type":"object","object":"atlas","atlas":"minecraft:items","sprite":"item/copper_helmet","color":"white"},{"text":" para desbloquearlo.","color":"gray"}]
execute unless score @s tb.acd matches 1.. run scoreboard players set @s tb.acd 60
