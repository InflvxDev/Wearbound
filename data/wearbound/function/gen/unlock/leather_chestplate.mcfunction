# GENERADO por tools/generate.py - no editar a mano
# Interno: @s rompió una pechera de cuero
scoreboard players set @s wb.b.leather_chestplate 0
execute if score @s wb.chestplate matches 1.. run return 0
scoreboard players set @s wb.chestplate 1
tellraw @s [{"text":""},{"text":"¡Nuevo tier! ","color":"gold","bold":true},{"text":"Ya puedes llevar ","color":"green"},{"text":"la pechera de cobre ","color":"white"},{"type":"object","object":"atlas","atlas":"minecraft:items","sprite":"item/copper_chestplate","color":"white"},{"text":". Siguiente: rompe ","color":"gray"},{"text":"una pechera de cobre ","color":"yellow"},{"type":"object","object":"atlas","atlas":"minecraft:items","sprite":"item/copper_chestplate","color":"white"},{"text":".","color":"gray"}]
execute at @s run playsound minecraft:entity.player.levelup master @s ~ ~ ~ 0.8 1.2
