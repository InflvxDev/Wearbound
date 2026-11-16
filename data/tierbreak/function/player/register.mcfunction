# Interno: guarda el nombre de @s en storage tierbreak:players list
# (así el panel de admin muestra también a los jugadores desconectados).
# El nombre se saca de su cabeza, generada en un item_display temporal.
execute at @s run summon minecraft:item_display ~ ~ ~ {Tags:["tb.name"]}
execute at @s run loot replace entity @n[type=minecraft:item_display,tag=tb.name,distance=..1] contents loot tierbreak:player_head
data modify storage tierbreak:tmp reg set value {}
execute at @s run data modify storage tierbreak:tmp reg.n set from entity @n[type=minecraft:item_display,tag=tb.name,distance=..1] item.components."minecraft:profile".name
data modify storage tierbreak:tmp reg.u set from entity @s UUID
kill @e[type=minecraft:item_display,tag=tb.name]
execute unless data storage tierbreak:tmp reg.n run return fail
function tierbreak:player/register_run with storage tierbreak:tmp reg
