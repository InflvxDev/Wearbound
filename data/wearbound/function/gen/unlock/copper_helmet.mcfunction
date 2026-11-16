# GENERADO por tools/generate.py - no editar a mano
# Interno: @s rompió un casco de cobre
scoreboard players set @s wb.b.copper_helmet 0
execute if score @s wb.helmet matches 2.. run return 0
scoreboard players set @s wb.helmet 2
tellraw @s [{"text":""},{"text":"¡Nuevo tier! ","color":"gold","bold":true},{"text":"Ya puedes llevar ","color":"green"},{"text":"el casco de hierro ","color":"white"},{"type":"object","object":"atlas","atlas":"minecraft:items","sprite":"item/iron_helmet","color":"white"},{"text":" y de cota de malla ","color":"white"},{"type":"object","object":"atlas","atlas":"minecraft:items","sprite":"item/chainmail_helmet","color":"white"},{"text":". Siguiente: rompe ","color":"gray"},{"text":"un casco de hierro ","color":"yellow"},{"type":"object","object":"atlas","atlas":"minecraft:items","sprite":"item/iron_helmet","color":"white"},{"text":" o de cota de malla ","color":"yellow"},{"type":"object","object":"atlas","atlas":"minecraft:items","sprite":"item/chainmail_helmet","color":"white"},{"text":".","color":"gray"}]
execute at @s run playsound minecraft:entity.player.levelup master @s ~ ~ ~ 0.8 1.2
