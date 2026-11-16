# GENERADO por tools/generate.py - no editar a mano
# Interno: el pico de cobre está bloqueado -> marca #lk y avisa (cada 2 s)
scoreboard players set #lk tb.calc 1
execute unless score @s tb.cd matches 1.. run title @s actionbar [{"text":""},{"text":"Aún no puedes usar el pico de cobre ","color":"red"},{"type":"object","object":"atlas","atlas":"minecraft:items","sprite":"item/copper_pickaxe","color":"white"},{"text":". Rompe ","color":"gray"},{"text":"un pico de piedra ","color":"yellow"},{"type":"object","object":"atlas","atlas":"minecraft:items","sprite":"item/stone_pickaxe","color":"white"},{"text":" para desbloquearlo.","color":"gray"}]
execute unless score @s tb.cd matches 1.. run scoreboard players set @s tb.cd 40
