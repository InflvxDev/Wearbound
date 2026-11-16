# Interno: cuenta atrás para mostrar el diálogo de la primera vez
scoreboard players remove @s wb.ask 1
execute if score @s wb.ask matches 0 run function wearbound:player/ask
