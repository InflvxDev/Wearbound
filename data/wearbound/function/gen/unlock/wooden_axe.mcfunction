# GENERADO por tools/generate.py - no editar a mano
# Interno: @s rompió un hacha de madera
scoreboard players set @s tb.b.wooden_axe 0
execute if score @s tb.axe matches 1.. run return 0
scoreboard players set @s tb.axe 1
tellraw @s [{"text":""},{"text":"¡Nuevo tier! ","color":"gold","bold":true},{"text":"Ya puedes usar ","color":"green"},{"text":"el hacha de piedra ","color":"white"},{"type":"object","object":"atlas","atlas":"minecraft:items","sprite":"item/stone_axe","color":"white"},{"text":". Siguiente: rompe ","color":"gray"},{"text":"un hacha de piedra ","color":"yellow"},{"type":"object","object":"atlas","atlas":"minecraft:items","sprite":"item/stone_axe","color":"white"},{"text":".","color":"gray"}]
execute at @s run playsound minecraft:entity.player.levelup master @s ~ ~ ~ 0.8 1.2
