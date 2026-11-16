# GENERADO por tools/generate.py - no editar a mano
# Interno: @s rompió una lanza de madera
scoreboard players set @s tb.b.wooden_spear 0
execute if score @s tb.spear matches 1.. run return 0
scoreboard players set @s tb.spear 1
tellraw @s [{"text":""},{"text":"¡Nuevo tier! ","color":"gold","bold":true},{"text":"Ya puedes usar ","color":"green"},{"text":"la lanza de piedra ","color":"white"},{"type":"object","object":"atlas","atlas":"minecraft:items","sprite":"item/stone_spear","color":"white"},{"text":". Siguiente: rompe ","color":"gray"},{"text":"una lanza de piedra ","color":"yellow"},{"type":"object","object":"atlas","atlas":"minecraft:items","sprite":"item/stone_spear","color":"white"},{"text":".","color":"gray"}]
execute at @s run playsound minecraft:entity.player.levelup master @s ~ ~ ~ 0.8 1.2
