# GENERADO por tools/generate.py - no editar a mano
# Interno: @s rompió una lanza de cobre
scoreboard players set @s tb.b.copper_spear 0
execute if score @s tb.spear matches 3.. run return 0
scoreboard players set @s tb.spear 3
tellraw @s [{"text":""},{"text":"¡Nuevo tier! ","color":"gold","bold":true},{"text":"Ya puedes usar ","color":"green"},{"text":"la lanza de hierro ","color":"white"},{"type":"object","object":"atlas","atlas":"minecraft:items","sprite":"item/iron_spear","color":"white"},{"text":". Siguiente: rompe ","color":"gray"},{"text":"una lanza de hierro ","color":"yellow"},{"type":"object","object":"atlas","atlas":"minecraft:items","sprite":"item/iron_spear","color":"white"},{"text":".","color":"gray"}]
execute at @s run playsound minecraft:entity.player.levelup master @s ~ ~ ~ 0.8 1.2
