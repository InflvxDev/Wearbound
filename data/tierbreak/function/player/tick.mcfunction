# Interno: cada tick, para cada jugador
# Roturas -> desbloquea el tier siguiente
function tierbreak:gen/breaks

execute if score @s tb.cd matches 1.. run scoreboard players remove @s tb.cd 1
execute if score @s tb.acd matches 1.. run scoreboard players remove @s tb.acd 1

# Creativo y espectador no tienen restricciones
execute if entity @s[gamemode=!creative,gamemode=!spectator] run function tierbreak:player/rules
execute unless entity @s[gamemode=!creative,gamemode=!spectator] run function tierbreak:lock/off
