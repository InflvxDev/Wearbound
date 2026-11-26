# Interno: {id}. Busca el nombre del jugador y hace la acción #op
#   1 = detalle, 2/3 = desbloquear todo/reiniciar (vuelve al detalle),
#   4/5 = lo mismo pero vuelve a la lista, 6 = confirmar reinicio desde la lista
$data modify storage wearbound:tmp sel.n set from storage wearbound:players list[{id:$(id)}].n
execute unless data storage wearbound:tmp sel.n run return run function wearbound:admin/list
# #back = 1: max/reset vuelven a la lista en vez de al detalle
scoreboard players set #back wb.calc 0
execute if score #op wb.calc matches 4..5 run scoreboard players set #back wb.calc 1
execute if score #op wb.calc matches 6 store result storage wearbound:tmp sel.r int 1 run scoreboard players add #id wb.calc 500000
execute if score #op wb.calc matches 1 run function wearbound:admin/player with storage wearbound:tmp sel
execute if score #op wb.calc matches 2 run function wearbound:admin/max with storage wearbound:tmp sel
execute if score #op wb.calc matches 3 run function wearbound:admin/reset with storage wearbound:tmp sel
execute if score #op wb.calc matches 4 run function wearbound:admin/max with storage wearbound:tmp sel
execute if score #op wb.calc matches 5 run function wearbound:admin/reset with storage wearbound:tmp sel
execute if score #op wb.calc matches 6 run function wearbound:admin/confirm_reset with storage wearbound:tmp sel
scoreboard players set #back wb.calc 0
