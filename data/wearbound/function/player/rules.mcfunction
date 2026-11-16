# Interno: aplica los bloqueos a @s (supervivencia o aventura)
# Armadura bloqueada -> vuelve al inventario
execute if items entity @s armor.* #wearbound:gated_armor run function wearbound:gen/armor_check

# Herramienta/arma bloqueada en la mano -> no puede minar, pegar ni usarla
scoreboard players set #lk wb.calc 0
execute if items entity @s weapon.* #wearbound:gated_tools run function wearbound:gen/hand_check
execute if score #lk wb.calc matches 1 run function wearbound:lock/on
execute if score #lk wb.calc matches 0 run function wearbound:lock/off
