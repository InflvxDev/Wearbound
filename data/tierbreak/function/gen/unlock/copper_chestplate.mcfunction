# GENERADO por tools/generate.py - no editar a mano
# Interno: @s rompió una pechera de cobre
scoreboard players set @s tb.b.copper_chestplate 0
execute if score @s tb.chestplate matches 2.. run return 0
scoreboard players set @s tb.chestplate 2
tellraw @s [{"text":""},{"text":"¡Nuevo tier! ","color":"gold","bold":true},{"text":"Ya puedes llevar ","color":"green"},{"text":"la pechera de hierro ","color":"white"},{"type":"object","object":"atlas","atlas":"minecraft:items","sprite":"item/iron_chestplate","color":"white"},{"text":" y de cota de malla ","color":"white"},{"type":"object","object":"atlas","atlas":"minecraft:items","sprite":"item/chainmail_chestplate","color":"white"},{"text":". Siguiente: rompe ","color":"gray"},{"text":"una pechera de hierro ","color":"yellow"},{"type":"object","object":"atlas","atlas":"minecraft:items","sprite":"item/iron_chestplate","color":"white"},{"text":" o de cota de malla ","color":"yellow"},{"type":"object","object":"atlas","atlas":"minecraft:items","sprite":"item/chainmail_chestplate","color":"white"},{"text":".","color":"gray"}]
execute at @s run playsound minecraft:entity.player.levelup master @s ~ ~ ~ 0.8 1.2
