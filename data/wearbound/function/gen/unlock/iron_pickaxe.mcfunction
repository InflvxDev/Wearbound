# GENERADO por tools/generate.py - no editar a mano
# Interno: @s rompió un pico de hierro
scoreboard players set @s wb.b.iron_pickaxe 0
execute if score @s wb.pickaxe matches 4.. run return 0
scoreboard players set @s wb.pickaxe 4
tellraw @s [{"text":""},{"text":"¡Nuevo tier! ","color":"gold","bold":true},{"text":"Ya puedes usar ","color":"green"},{"text":"el pico de diamante ","color":"white"},{"type":"object","object":"atlas","atlas":"minecraft:items","sprite":"item/diamond_pickaxe","color":"white"},{"text":" y de netherita ","color":"white"},{"type":"object","object":"atlas","atlas":"minecraft:items","sprite":"item/netherite_pickaxe","color":"white"},{"text":". Es el tier máximo.","color":"aqua"}]
execute at @s run playsound minecraft:entity.player.levelup master @s ~ ~ ~ 0.8 1.2
