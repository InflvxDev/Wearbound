# GENERADO por tools/generate.py - no editar a mano
# Interno: el hacha de piedra está bloqueada -> marca #lk y avisa (cada 2 s)
scoreboard players set #lk tb.calc 1
execute unless score @s tb.cd matches 1.. run title @s actionbar [{"text":""},{"text":"Aún no puedes usar el hacha de piedra ","color":"red"},{"type":"object","object":"atlas","atlas":"minecraft:items","sprite":"item/stone_axe","color":"white"},{"text":". Rompe ","color":"gray"},{"text":"un hacha de madera ","color":"yellow"},{"type":"object","object":"atlas","atlas":"minecraft:items","sprite":"item/wooden_axe","color":"white"},{"text":" para desbloquearla.","color":"gray"}]
execute unless score @s tb.cd matches 1.. run scoreboard players set @s tb.cd 40
