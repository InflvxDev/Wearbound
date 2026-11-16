# Interno: procesa sorted[0] y sigue (recursivo)
scoreboard players add #pos wb.calc 1
execute if score #pos wb.calc matches ..100 run function wearbound:admin/row
data remove storage wearbound:tmp sorted[0]
execute if data storage wearbound:tmp sorted[0] run function wearbound:admin/row_loop
