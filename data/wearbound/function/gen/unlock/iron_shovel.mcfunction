# GENERADO por tools/generate.py - no editar a mano
# Interno: @s rompió una pala de hierro
scoreboard players set @s wb.b.iron_shovel 0
execute if score @s wb.shovel matches 4.. run return 0
scoreboard players set @s wb.shovel 4
tellraw @s [{"text":""},{"text":"¡Nuevo tier! ","color":"gold","bold":true},{"text":"Ya puedes usar ","color":"green"},{"text":"la pala de diamante ","color":"white"},{"type":"object","object":"atlas","atlas":"minecraft:items","sprite":"item/diamond_shovel","color":"white"},{"text":" y de netherita ","color":"white"},{"type":"object","object":"atlas","atlas":"minecraft:items","sprite":"item/netherite_shovel","color":"white"},{"text":". Es el tier máximo.","color":"aqua"}]
execute at @s run playsound minecraft:entity.player.levelup master @s ~ ~ ~ 0.8 1.2
