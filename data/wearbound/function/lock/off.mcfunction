# Interno: quita el bloqueo de @s (ya no tiene nada bloqueado en la mano)
execute unless score @s wb.lock matches 1 run return 0
scoreboard players set @s wb.lock 0
scoreboard players set @s wb.cd 0
attribute @s minecraft:block_break_speed modifier remove wearbound:lock
attribute @s minecraft:attack_damage modifier remove wearbound:lock
attribute @s minecraft:entity_interaction_range modifier remove wearbound:lock
attribute @s minecraft:block_interaction_range modifier remove wearbound:lock
