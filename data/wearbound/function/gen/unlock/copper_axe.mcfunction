# GENERADO por tools/generate.py - no editar a mano
# Interno: @s rompió un hacha de cobre
scoreboard players set @s wb.b.copper_axe 0
execute if score @s wb.axe matches 3.. run return 0
scoreboard players set @s wb.axe 3
tellraw @s [{"text":""},{"text":"¡Nuevo tier! ","color":"gold","bold":true},{"text":"Ya puedes usar ","color":"green"},{"text":"el hacha de hierro ","color":"white"},{"type":"object","object":"atlas","atlas":"minecraft:items","sprite":"item/iron_axe","color":"white"},{"text":". Siguiente: rompe ","color":"gray"},{"text":"un hacha de hierro ","color":"yellow"},{"type":"object","object":"atlas","atlas":"minecraft:items","sprite":"item/iron_axe","color":"white"},{"text":".","color":"gray"}]
execute at @s run playsound minecraft:entity.player.levelup master @s ~ ~ ~ 0.8 1.2
