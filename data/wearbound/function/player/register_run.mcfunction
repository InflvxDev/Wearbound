# Interno: {n, u}. Si el UUID ya estaba, solo actualiza el nombre (cambio de nick).
# Cada jugador tiene un id numérico para los botones del panel (/trigger wb.admin).
$execute if data storage wearbound:players list[{u:$(u)}] run data modify storage wearbound:players list[{u:$(u)}].n set value "$(n)"
$execute unless data storage wearbound:players list[{u:$(u)}] run data modify storage wearbound:players list append value {n:"$(n)",u:$(u)}
$execute unless data storage wearbound:players list[{u:$(u)}].id store result storage wearbound:players list[{u:$(u)}].id int 1 run scoreboard players add #next wb.calc 1
