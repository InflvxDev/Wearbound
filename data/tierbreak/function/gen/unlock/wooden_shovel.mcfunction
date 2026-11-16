# GENERADO por tools/generate.py - no editar a mano
# Interno: @s rompió una pala de madera
scoreboard players set @s tb.b.wooden_shovel 0
execute if score @s tb.shovel matches 1.. run return 0
scoreboard players set @s tb.shovel 1
tellraw @s [{"text":""},{"text":"¡Nuevo tier! ","color":"gold","bold":true},{"text":"Ya puedes usar ","color":"green"},{"text":"la pala de piedra ","color":"white"},{"type":"object","object":"atlas","atlas":"minecraft:items","sprite":"item/stone_shovel","color":"white"},{"text":". Siguiente: rompe ","color":"gray"},{"text":"una pala de piedra ","color":"yellow"},{"type":"object","object":"atlas","atlas":"minecraft:items","sprite":"item/stone_shovel","color":"white"},{"text":".","color":"gray"}]
execute at @s run playsound minecraft:entity.player.levelup master @s ~ ~ ~ 0.8 1.2
