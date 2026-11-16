# GENERADO por tools/generate.py - no editar a mano
# Interno: @s rompió una azada de cobre
scoreboard players set @s tb.b.copper_hoe 0
execute if score @s tb.hoe matches 3.. run return 0
scoreboard players set @s tb.hoe 3
tellraw @s [{"text":""},{"text":"¡Nuevo tier! ","color":"gold","bold":true},{"text":"Ya puedes usar ","color":"green"},{"text":"la azada de hierro ","color":"white"},{"type":"object","object":"atlas","atlas":"minecraft:items","sprite":"item/iron_hoe","color":"white"},{"text":". Siguiente: rompe ","color":"gray"},{"text":"una azada de hierro ","color":"yellow"},{"type":"object","object":"atlas","atlas":"minecraft:items","sprite":"item/iron_hoe","color":"white"},{"text":".","color":"gray"}]
execute at @s run playsound minecraft:entity.player.levelup master @s ~ ~ ~ 0.8 1.2
