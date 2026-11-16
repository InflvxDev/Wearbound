# GENERADO por tools/generate.py - no editar a mano
# Interno: @s rompió una azada de hierro
scoreboard players set @s tb.b.iron_hoe 0
execute if score @s tb.hoe matches 4.. run return 0
scoreboard players set @s tb.hoe 4
tellraw @s [{"text":""},{"text":"¡Nuevo tier! ","color":"gold","bold":true},{"text":"Ya puedes usar ","color":"green"},{"text":"la azada de diamante ","color":"white"},{"type":"object","object":"atlas","atlas":"minecraft:items","sprite":"item/diamond_hoe","color":"white"},{"text":" y de netherita ","color":"white"},{"type":"object","object":"atlas","atlas":"minecraft:items","sprite":"item/netherite_hoe","color":"white"},{"text":". Es el tier máximo.","color":"aqua"}]
execute at @s run playsound minecraft:entity.player.levelup master @s ~ ~ ~ 0.8 1.2
