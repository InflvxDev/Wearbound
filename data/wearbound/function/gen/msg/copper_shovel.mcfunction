# GENERADO por tools/generate.py - no editar a mano
# Interno: la pala de cobre está bloqueada -> marca #lk y avisa (cada 2 s)
scoreboard players set #lk tb.calc 1
execute unless score @s tb.cd matches 1.. run title @s actionbar [{"text":""},{"text":"Aún no puedes usar la pala de cobre ","color":"red"},{"type":"object","object":"atlas","atlas":"minecraft:items","sprite":"item/copper_shovel","color":"white"},{"text":". Rompe ","color":"gray"},{"text":"una pala de piedra ","color":"yellow"},{"type":"object","object":"atlas","atlas":"minecraft:items","sprite":"item/stone_shovel","color":"white"},{"text":" para desbloquearla.","color":"gray"}]
execute unless score @s tb.cd matches 1.. run scoreboard players set @s tb.cd 40
