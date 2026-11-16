# Interno: {id}. Busca el nombre del jugador y hace la acción #op
$data modify storage wearbound:tmp sel.n set from storage wearbound:players list[{id:$(id)}].n
execute unless data storage wearbound:tmp sel.n run return run function wearbound:admin/list
execute if score #op wb.calc matches 1 run function wearbound:admin/player with storage wearbound:tmp sel
execute if score #op wb.calc matches 2 run function wearbound:admin/max with storage wearbound:tmp sel
execute if score #op wb.calc matches 3 run function wearbound:admin/reset with storage wearbound:tmp sel
