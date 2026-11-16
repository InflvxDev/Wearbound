# GENERADO por tools/generate.py - no editar a mano
# Interno: la azada de diamante está bloqueada -> marca #lk y avisa (cada 2 s)
scoreboard players set #lk tb.calc 1
execute unless score @s tb.cd matches 1.. run title @s actionbar [{"text":""},{"text":"Aún no puedes usar la azada de diamante ","color":"red"},{"type":"object","object":"atlas","atlas":"minecraft:items","sprite":"item/diamond_hoe","color":"white"},{"text":". Rompe ","color":"gray"},{"text":"una azada de hierro ","color":"yellow"},{"type":"object","object":"atlas","atlas":"minecraft:items","sprite":"item/iron_hoe","color":"white"},{"text":" para desbloquearla.","color":"gray"}]
execute unless score @s tb.cd matches 1.. run scoreboard players set @s tb.cd 40
