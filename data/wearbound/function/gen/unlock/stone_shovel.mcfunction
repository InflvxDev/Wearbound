# GENERADO por tools/generate.py - no editar a mano
# Interno: @s rompió una pala de piedra
scoreboard players set @s wb.b.stone_shovel 0
execute if score @s wb.shovel matches 2.. run return 0
scoreboard players set @s wb.shovel 2
tellraw @s [{"text":""},{"text":"¡Nuevo tier! ","color":"gold","bold":true},{"text":"Ya puedes usar ","color":"green"},{"text":"la pala de cobre ","color":"white"},{"type":"object","object":"atlas","atlas":"minecraft:items","sprite":"item/copper_shovel","color":"white"},{"text":". Siguiente: rompe ","color":"gray"},{"text":"una pala de cobre ","color":"yellow"},{"type":"object","object":"atlas","atlas":"minecraft:items","sprite":"item/copper_shovel","color":"white"},{"text":".","color":"gray"}]
execute at @s run playsound minecraft:entity.player.levelup master @s ~ ~ ~ 0.8 1.2
