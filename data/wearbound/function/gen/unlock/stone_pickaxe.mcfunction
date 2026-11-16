# GENERADO por tools/generate.py - no editar a mano
# Interno: @s rompió un pico de piedra
scoreboard players set @s wb.b.stone_pickaxe 0
execute if score @s wb.pickaxe matches 2.. run return 0
scoreboard players set @s wb.pickaxe 2
tellraw @s [{"text":""},{"text":"¡Nuevo tier! ","color":"gold","bold":true},{"text":"Ya puedes usar ","color":"green"},{"text":"el pico de cobre ","color":"white"},{"type":"object","object":"atlas","atlas":"minecraft:items","sprite":"item/copper_pickaxe","color":"white"},{"text":". Siguiente: rompe ","color":"gray"},{"text":"un pico de cobre ","color":"yellow"},{"type":"object","object":"atlas","atlas":"minecraft:items","sprite":"item/copper_pickaxe","color":"white"},{"text":".","color":"gray"}]
execute at @s run playsound minecraft:entity.player.levelup master @s ~ ~ ~ 0.8 1.2
