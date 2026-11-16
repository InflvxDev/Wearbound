# GENERADO por tools/generate.py - no editar a mano
# Interno: @s se puso los pantalones de cota de malla sin tenerlos desbloqueados
function wearbound:armor/kick {slot:"legs"}
title @s actionbar [{"text":""},{"text":"Aún no puedes llevar los pantalones de cota de malla ","color":"red"},{"type":"object","object":"atlas","atlas":"minecraft:items","sprite":"item/chainmail_leggings","color":"white"},{"text":". Rompe ","color":"gray"},{"text":"unos pantalones de cobre ","color":"yellow"},{"type":"object","object":"atlas","atlas":"minecraft:items","sprite":"item/copper_leggings","color":"white"},{"text":" para desbloquearlos.","color":"gray"}]
execute at @s run playsound minecraft:block.note_block.bass master @s ~ ~ ~ 0.8 0.6
execute unless score @s wb.acd matches 1.. run tellraw @s [{"text":""},{"text":"Aún no puedes llevar los pantalones de cota de malla ","color":"red"},{"type":"object","object":"atlas","atlas":"minecraft:items","sprite":"item/chainmail_leggings","color":"white"},{"text":". Rompe ","color":"gray"},{"text":"unos pantalones de cobre ","color":"yellow"},{"type":"object","object":"atlas","atlas":"minecraft:items","sprite":"item/copper_leggings","color":"white"},{"text":" para desbloquearlos.","color":"gray"}]
execute unless score @s wb.acd matches 1.. run scoreboard players set @s wb.acd 60
