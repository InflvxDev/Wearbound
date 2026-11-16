# GENERADO por tools/generate.py - no editar a mano
# Interno: la lanza de hierro está bloqueada -> marca #lk y avisa (cada 2 s)
scoreboard players set #lk wb.calc 1
execute unless score @s wb.cd matches 1.. run title @s actionbar [{"text":""},{"text":"Aún no puedes usar la lanza de hierro ","color":"red"},{"type":"object","object":"atlas","atlas":"minecraft:items","sprite":"item/iron_spear","color":"white"},{"text":". Rompe ","color":"gray"},{"text":"una lanza de cobre ","color":"yellow"},{"type":"object","object":"atlas","atlas":"minecraft:items","sprite":"item/copper_spear","color":"white"},{"text":" para desbloquearla.","color":"gray"}]
execute unless score @s wb.cd matches 1.. run scoreboard players set @s wb.cd 40
