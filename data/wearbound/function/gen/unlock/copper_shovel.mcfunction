# GENERADO por tools/generate.py - no editar a mano
# Interno: @s rompió una pala de cobre
scoreboard players set @s wb.b.copper_shovel 0
execute if score @s wb.shovel matches 3.. run return 0
scoreboard players set @s wb.shovel 3
tellraw @s [{"text":""},{"text":"¡Nuevo tier! ","color":"gold","bold":true},{"text":"Ya puedes usar ","color":"green"},{"text":"la pala de hierro ","color":"white"},{"type":"object","object":"atlas","atlas":"minecraft:items","sprite":"item/iron_shovel","color":"white"},{"text":". Siguiente: rompe ","color":"gray"},{"text":"una pala de hierro ","color":"yellow"},{"type":"object","object":"atlas","atlas":"minecraft:items","sprite":"item/iron_shovel","color":"white"},{"text":".","color":"gray"}]
execute at @s run playsound minecraft:entity.player.levelup master @s ~ ~ ~ 0.8 1.2
