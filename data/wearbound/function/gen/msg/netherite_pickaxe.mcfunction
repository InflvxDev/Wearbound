# GENERADO por tools/generate.py - no editar a mano
# Interno: el pico de netherita está bloqueado -> marca #lk y avisa (cada 2 s)
scoreboard players set #lk wb.calc 1
execute unless score @s wb.cd matches 1.. run title @s actionbar [{"text":""},{"text":"Aún no puedes usar el pico de netherita ","color":"red"},{"type":"object","object":"atlas","atlas":"minecraft:items","sprite":"item/netherite_pickaxe","color":"white"},{"text":". Desbloquea el tier de diamante para usarlo.","color":"gray"}]
execute unless score @s wb.cd matches 1.. run scoreboard players set @s wb.cd 40
