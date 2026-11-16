# Interno: guarda el nombre de @s en storage wearbound:players list
# (así el panel de admin muestra también a los jugadores desconectados).
# El nombre se saca de su cabeza, generada en un item_display temporal.
execute at @s run summon minecraft:item_display ~ ~ ~ {Tags:["wb.name"]}
execute at @s run loot replace entity @n[type=minecraft:item_display,tag=wb.name,distance=..1] contents loot wearbound:player_head
data modify storage wearbound:tmp reg set value {}
execute at @s run data modify storage wearbound:tmp reg.n set from entity @n[type=minecraft:item_display,tag=wb.name,distance=..1] item.components."minecraft:profile".name
data modify storage wearbound:tmp reg.u set from entity @s UUID
kill @e[type=minecraft:item_display,tag=wb.name]
execute unless data storage wearbound:tmp reg.n run return fail
function wearbound:player/register_run with storage wearbound:tmp reg
