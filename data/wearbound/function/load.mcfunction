# Wearbound - carga
scoreboard objectives add wb.calc dummy
# Detecta cuando un jugador vuelve a entrar
scoreboard objectives add wb.leave minecraft.custom:minecraft.leave_game
# Ya eligió su progresión (1)
scoreboard objectives add wb.seen dummy
# Progresión elegida: 1 = Wearbound, 2 = vanilla
scoreboard objectives add wb.mode dummy
# Botones del diálogo de la primera vez (cualquier jugador, sin OP)
scoreboard objectives add wb.pick trigger
# Ticks que faltan para mostrar el diálogo de la primera vez
scoreboard objectives add wb.ask dummy
# Tiene puestos los modificadores de bloqueo (1)
scoreboard objectives add wb.lock dummy
# Esperas de los avisos (en ticks) para no repetirlos cada tick
scoreboard objectives add wb.cd dummy
scoreboard objectives add wb.acd dummy
scoreboard players set #2 wb.calc 2
scoreboard players set #100000 wb.calc 100000
# Botones del panel de admin (solo funciona para quien abrió /function wearbound:menu)
scoreboard objectives add wb.admin trigger

# Tiers por tipo (wb.sword, wb.boots, ...) y estadísticas de roturas (wb.b.*)
function wearbound:gen/objectives
function wearbound:gen/db
execute unless data storage wearbound:players list run data modify storage wearbound:players list set value []

execute as @a run function wearbound:player/login
