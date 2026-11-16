# GENERADO por tools/generate.py - no editar a mano
# Interno: @s rompió unas botas de cobre
scoreboard players set @s tb.b.copper_boots 0
execute if score @s tb.boots matches 2.. run return 0
scoreboard players set @s tb.boots 2
tellraw @s [{"text":""},{"text":"¡Nuevo tier! ","color":"gold","bold":true},{"text":"Ya puedes llevar ","color":"green"},{"text":"las botas de hierro ","color":"white"},{"type":"object","object":"atlas","atlas":"minecraft:items","sprite":"item/iron_boots","color":"white"},{"text":" y de cota de malla ","color":"white"},{"type":"object","object":"atlas","atlas":"minecraft:items","sprite":"item/chainmail_boots","color":"white"},{"text":". Siguiente: rompe ","color":"gray"},{"text":"unas botas de hierro ","color":"yellow"},{"type":"object","object":"atlas","atlas":"minecraft:items","sprite":"item/iron_boots","color":"white"},{"text":" o de cota de malla ","color":"yellow"},{"type":"object","object":"atlas","atlas":"minecraft:items","sprite":"item/chainmail_boots","color":"white"},{"text":".","color":"gray"}]
execute at @s run playsound minecraft:entity.player.levelup master @s ~ ~ ~ 0.8 1.2
