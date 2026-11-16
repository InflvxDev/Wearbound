# GENERADO por tools/generate.py - no editar a mano
# Interno: la lanza de netherita está bloqueada -> marca #lk y avisa (cada 2 s)
scoreboard players set #lk wb.calc 1
execute unless score @s wb.cd matches 1.. run title @s actionbar [{"text":""},{"text":"Aún no puedes usar la lanza de netherita ","color":"red"},{"type":"object","object":"atlas","atlas":"minecraft:items","sprite":"item/netherite_spear","color":"white"},{"text":". Desbloquea el tier de diamante para usarla.","color":"gray"}]
execute unless score @s wb.cd matches 1.. run scoreboard players set @s wb.cd 40
