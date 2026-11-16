# GENERADO por tools/generate.py - no editar a mano
# Interno: @s rompió un casco de cuero
scoreboard players set @s wb.b.leather_helmet 0
execute if score @s wb.helmet matches 1.. run return 0
scoreboard players set @s wb.helmet 1
tellraw @s [{"text":""},{"text":"¡Nuevo tier! ","color":"gold","bold":true},{"text":"Ya puedes llevar ","color":"green"},{"text":"el casco de cobre ","color":"white"},{"type":"object","object":"atlas","atlas":"minecraft:items","sprite":"item/copper_helmet","color":"white"},{"text":". Siguiente: rompe ","color":"gray"},{"text":"un casco de cobre ","color":"yellow"},{"type":"object","object":"atlas","atlas":"minecraft:items","sprite":"item/copper_helmet","color":"white"},{"text":".","color":"gray"}]
execute at @s run playsound minecraft:entity.player.levelup master @s ~ ~ ~ 0.8 1.2
