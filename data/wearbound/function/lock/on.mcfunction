# Interno: @s tiene en la mano una herramienta/arma de un tier bloqueado.
# Velocidad de minado, daño y alcance a 0. Se reintenta cada tick por si los
# modificadores se perdieron (al morir, etc.); si ya estaban, el comando falla sin efecto.
attribute @s minecraft:block_break_speed modifier add wearbound:lock -1 add_multiplied_total
attribute @s minecraft:attack_damage modifier add wearbound:lock -1 add_multiplied_total
attribute @s minecraft:entity_interaction_range modifier add wearbound:lock -1 add_multiplied_total
attribute @s minecraft:block_interaction_range modifier add wearbound:lock -1 add_multiplied_total
execute if score @s wb.lock matches 1 run return 0
scoreboard players set @s wb.lock 1
execute at @s run playsound minecraft:block.note_block.bass master @s ~ ~ ~ 0.7 0.6
