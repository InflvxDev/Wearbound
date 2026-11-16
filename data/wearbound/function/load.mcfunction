# Tier Break - carga
scoreboard objectives add tb.calc dummy
# Detecta cuando un jugador vuelve a entrar
scoreboard objectives add tb.leave minecraft.custom:minecraft.leave_game
# Ya vio la explicación (1)
scoreboard objectives add tb.seen dummy
# Tiene puestos los modificadores de bloqueo (1)
scoreboard objectives add tb.lock dummy
# Esperas de los avisos (en ticks) para no repetirlos cada tick
scoreboard objectives add tb.cd dummy
scoreboard objectives add tb.acd dummy
scoreboard players set #2 tb.calc 2

# Tiers por tipo (tb.sword, tb.boots, ...) y estadísticas de roturas (tb.b.*)
function tierbreak:gen/objectives
function tierbreak:gen/db
execute unless data storage tierbreak:players list run data modify storage tierbreak:players list set value []

execute as @a run function tierbreak:player/login
