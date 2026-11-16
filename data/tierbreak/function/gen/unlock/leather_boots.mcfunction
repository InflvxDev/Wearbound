# GENERADO por tools/generate.py - no editar a mano
# Interno: @s rompió unas botas de cuero
scoreboard players set @s tb.b.leather_boots 0
execute if score @s tb.boots matches 1.. run return 0
scoreboard players set @s tb.boots 1
tellraw @s [{"text":""},{"text":"¡Nuevo tier! ","color":"gold","bold":true},{"text":"Ya puedes llevar ","color":"green"},{"text":"las botas de cobre ","color":"white"},{"type":"object","object":"atlas","atlas":"minecraft:items","sprite":"item/copper_boots","color":"white"},{"text":". Siguiente: rompe ","color":"gray"},{"text":"unas botas de cobre ","color":"yellow"},{"type":"object","object":"atlas","atlas":"minecraft:items","sprite":"item/copper_boots","color":"white"},{"text":".","color":"gray"}]
execute at @s run playsound minecraft:entity.player.levelup master @s ~ ~ ~ 0.8 1.2
