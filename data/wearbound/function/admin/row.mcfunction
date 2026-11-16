# Interno: prepara {p, n, v, m, k, d} para la fila "N. [cabeza] Jugador ..... íconos  v/m"
data modify storage wearbound:tmp r set value {}
data modify storage wearbound:tmp r.n set from storage wearbound:tmp sorted[0].n
data modify storage wearbound:tmp r.v set from storage wearbound:tmp sorted[0].v
data modify storage wearbound:tmp r.m set from storage wearbound:db max
execute store result score #v wb.calc run data get storage wearbound:tmp r.v
execute store result storage wearbound:tmp r.p int 1 run scoreboard players get #pos wb.calc
# d = valor del trigger para abrir su detalle
execute store result score #id wb.calc run data get storage wearbound:tmp sorted[0].id
execute store result storage wearbound:tmp r.d int 1 run scoreboard players add #id wb.calc 100000
# Relleno con puntos para que los íconos queden más o menos alineados
scoreboard players set #pad wb.calc 18
execute store result score #len wb.calc run data get storage wearbound:tmp r.n
scoreboard players operation #pad wb.calc -= #len wb.calc
execute if score #pos wb.calc matches 10.. run scoreboard players remove #pad wb.calc 1
execute if score #pos wb.calc matches 100.. run scoreboard players remove #pad wb.calc 1
execute if score #pad wb.calc matches ..0 run scoreboard players set #pad wb.calc 0
execute store result storage wearbound:tmp r.k int 1 run scoreboard players get #pad wb.calc
function wearbound:admin/row_build with storage wearbound:tmp r
