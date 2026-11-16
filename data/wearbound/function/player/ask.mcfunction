# Interno: pregunta a @s qué progresión quiere (solo si todavía no eligió)
execute if score @s wb.seen matches 1 run return run scoreboard players reset @s wb.ask
scoreboard players enable @s wb.pick
dialog show @s wearbound:choose
# Si el diálogo se cierra sin elegir (por ejemplo al morir), vuelve a salir en 30 s
scoreboard players set @s wb.ask 600
