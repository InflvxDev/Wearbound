# GENERADO por tools/generate.py - no editar a mano
# Interno: @s rompió un casco de hierro
scoreboard players set @s wb.b.iron_helmet 0
execute if score @s wb.helmet matches 3.. run return 0
scoreboard players set @s wb.helmet 3
tellraw @s [{"text":""},{"text":"¡Nuevo tier! ","color":"gold","bold":true},{"text":"Ya puedes llevar ","color":"green"},{"text":"el casco de diamante ","color":"white"},{"type":"object","object":"atlas","atlas":"minecraft:items","sprite":"item/diamond_helmet","color":"white"},{"text":" y de netherita ","color":"white"},{"type":"object","object":"atlas","atlas":"minecraft:items","sprite":"item/netherite_helmet","color":"white"},{"text":". Es el tier máximo.","color":"aqua"}]
execute at @s run playsound minecraft:entity.player.levelup master @s ~ ~ ~ 0.8 1.2
