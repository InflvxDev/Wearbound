# GENERADO por tools/generate.py - no editar a mano
# Interno: @s rompió una espada de madera
scoreboard players set @s wb.b.wooden_sword 0
execute if score @s wb.sword matches 1.. run return 0
scoreboard players set @s wb.sword 1
tellraw @s [{"text":""},{"text":"¡Nuevo tier! ","color":"gold","bold":true},{"text":"Ya puedes usar ","color":"green"},{"text":"la espada de piedra ","color":"white"},{"type":"object","object":"atlas","atlas":"minecraft:items","sprite":"item/stone_sword","color":"white"},{"text":". Siguiente: rompe ","color":"gray"},{"text":"una espada de piedra ","color":"yellow"},{"type":"object","object":"atlas","atlas":"minecraft:items","sprite":"item/stone_sword","color":"white"},{"text":".","color":"gray"}]
execute at @s run playsound minecraft:entity.player.levelup master @s ~ ~ ~ 0.8 1.2
