# Interno: aplica los bloqueos a @s (supervivencia o aventura)
# Armadura bloqueada -> vuelve al inventario
execute if items entity @s armor.* #tierbreak:gated_armor run function tierbreak:gen/armor_check

# Herramienta/arma bloqueada en la mano -> no puede minar, pegar ni usarla
scoreboard players set #lk tb.calc 0
execute if items entity @s weapon.* #tierbreak:gated_tools run function tierbreak:gen/hand_check
execute if score #lk tb.calc matches 1 run function tierbreak:lock/on
execute if score #lk tb.calc matches 0 run function tierbreak:lock/off
