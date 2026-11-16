# GENERADO por tools/generate.py - no editar a mano
# Interno: @s rompió una pechera de cota de malla
scoreboard players set @s wb.b.chainmail_chestplate 0
execute if score @s wb.chestplate matches 3.. run return 0
scoreboard players set @s wb.chestplate 3
tellraw @s [{"text":""},{"text":"¡Nuevo tier! ","color":"gold","bold":true},{"text":"Ya puedes llevar ","color":"green"},{"text":"la pechera de diamante ","color":"white"},{"type":"object","object":"atlas","atlas":"minecraft:items","sprite":"item/diamond_chestplate","color":"white"},{"text":" y de netherita ","color":"white"},{"type":"object","object":"atlas","atlas":"minecraft:items","sprite":"item/netherite_chestplate","color":"white"},{"text":". Es el tier máximo.","color":"aqua"}]
execute at @s run playsound minecraft:entity.player.levelup master @s ~ ~ ~ 0.8 1.2
