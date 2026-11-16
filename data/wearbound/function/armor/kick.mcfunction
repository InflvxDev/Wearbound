# Interno: {slot}. Saca la pieza del slot de armadura de @s y se la devuelve
# como ítem que solo @s puede recoger (entra al inventario al instante;
# si lo tiene lleno, queda en el suelo a sus pies).
execute at @s run summon minecraft:item ~ ~0.5 ~ {Item:{id:"minecraft:stone",count:1},PickupDelay:0s,Tags:["wb.kick"]}
$item replace entity @e[type=minecraft:item,tag=wb.kick,limit=1] contents from entity @s armor.$(slot)
data modify entity @e[type=minecraft:item,tag=wb.kick,limit=1] Owner set from entity @s UUID
tag @e[type=minecraft:item,tag=wb.kick] remove wb.kick
$item replace entity @s armor.$(slot) with minecraft:air
