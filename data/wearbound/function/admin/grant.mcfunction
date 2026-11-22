# Interno: da permiso del panel a @s por 2 minutos (2400 ticks; cada botón los renueva).
# Solo si lo abrió él mismo: con /execute as la posición sigue siendo la de quien
# escribió el comando, así no se le puede abrir a otro jugador por accidente.
execute unless entity @s[distance=..0.01] run return fail
tag @s add wb.admin
scoreboard players set @s wb.time 2400
scoreboard players enable @s wb.admin
return 1
