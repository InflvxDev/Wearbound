# GENERADO por tools/generate.py - no editar a mano
# Interno: @s rompió unos pantalones de cobre
scoreboard players set @s wb.b.copper_leggings 0
execute if score @s wb.leggings matches 2.. run return 0
scoreboard players set @s wb.leggings 2
tellraw @s [{"text":""},{"text":"¡Nuevo tier! ","color":"gold","bold":true},{"text":"Ya puedes llevar ","color":"green"},{"text":"los pantalones de hierro ","color":"white"},{"type":"object","object":"atlas","atlas":"minecraft:items","sprite":"item/iron_leggings","color":"white"},{"text":" y de cota de malla ","color":"white"},{"type":"object","object":"atlas","atlas":"minecraft:items","sprite":"item/chainmail_leggings","color":"white"},{"text":". Siguiente: rompe ","color":"gray"},{"text":"unos pantalones de hierro ","color":"yellow"},{"type":"object","object":"atlas","atlas":"minecraft:items","sprite":"item/iron_leggings","color":"white"},{"text":" o de cota de malla ","color":"yellow"},{"type":"object","object":"atlas","atlas":"minecraft:items","sprite":"item/chainmail_leggings","color":"white"},{"text":".","color":"gray"}]
execute at @s run playsound minecraft:entity.player.levelup master @s ~ ~ ~ 0.8 1.2
