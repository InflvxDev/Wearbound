# GENERADO por tools/generate.py - no editar a mano
# Interno: @s rompió unos pantalones de cuero
scoreboard players set @s wb.b.leather_leggings 0
execute if score @s wb.leggings matches 1.. run return 0
scoreboard players set @s wb.leggings 1
tellraw @s [{"text":""},{"text":"¡Nuevo tier! ","color":"gold","bold":true},{"text":"Ya puedes llevar ","color":"green"},{"text":"los pantalones de cobre ","color":"white"},{"type":"object","object":"atlas","atlas":"minecraft:items","sprite":"item/copper_leggings","color":"white"},{"text":". Siguiente: rompe ","color":"gray"},{"text":"unos pantalones de cobre ","color":"yellow"},{"type":"object","object":"atlas","atlas":"minecraft:items","sprite":"item/copper_leggings","color":"white"},{"text":".","color":"gray"}]
execute at @s run playsound minecraft:entity.player.levelup master @s ~ ~ ~ 0.8 1.2
