# GENERADO por tools/generate.py - no editar a mano
# Interno: @s rompió una azada de piedra
scoreboard players set @s tb.b.stone_hoe 0
execute if score @s tb.hoe matches 2.. run return 0
scoreboard players set @s tb.hoe 2
tellraw @s [{"text":""},{"text":"¡Nuevo tier! ","color":"gold","bold":true},{"text":"Ya puedes usar ","color":"green"},{"text":"la azada de cobre ","color":"white"},{"type":"object","object":"atlas","atlas":"minecraft:items","sprite":"item/copper_hoe","color":"white"},{"text":". Siguiente: rompe ","color":"gray"},{"text":"una azada de cobre ","color":"yellow"},{"type":"object","object":"atlas","atlas":"minecraft:items","sprite":"item/copper_hoe","color":"white"},{"text":".","color":"gray"}]
execute at @s run playsound minecraft:entity.player.levelup master @s ~ ~ ~ 0.8 1.2
