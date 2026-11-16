# GENERADO por tools/generate.py - no editar a mano
# Interno: el pico de piedra está bloqueado -> marca #lk y avisa (cada 2 s)
scoreboard players set #lk wb.calc 1
execute unless score @s wb.cd matches 1.. run title @s actionbar [{"text":""},{"text":"Aún no puedes usar el pico de piedra ","color":"red"},{"type":"object","object":"atlas","atlas":"minecraft:items","sprite":"item/stone_pickaxe","color":"white"},{"text":". Rompe ","color":"gray"},{"text":"un pico de madera ","color":"yellow"},{"type":"object","object":"atlas","atlas":"minecraft:items","sprite":"item/wooden_pickaxe","color":"white"},{"text":" para desbloquearlo.","color":"gray"}]
execute unless score @s wb.cd matches 1.. run scoreboard players set @s wb.cd 40
