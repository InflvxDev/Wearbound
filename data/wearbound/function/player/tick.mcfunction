# Interno: cada tick, para cada jugador
# Roturas -> desbloquea el tier siguiente
function wearbound:gen/breaks

execute if score @s wb.cd matches 1.. run scoreboard players remove @s wb.cd 1
execute if score @s wb.acd matches 1.. run scoreboard players remove @s wb.acd 1

# Creativo y espectador no tienen restricciones
execute if entity @s[gamemode=!creative,gamemode=!spectator] run function wearbound:player/rules
execute unless entity @s[gamemode=!creative,gamemode=!spectator] run function wearbound:lock/off
