# Interno: prepara {p, n, v, m, k} para la fila "N. [cabeza] Jugador ..... íconos  v/m"
data modify storage tierbreak:tmp r set value {}
data modify storage tierbreak:tmp r.n set from storage tierbreak:tmp sorted[0].n
data modify storage tierbreak:tmp r.v set from storage tierbreak:tmp sorted[0].v
data modify storage tierbreak:tmp r.m set from storage tierbreak:db max
execute store result score #v tb.calc run data get storage tierbreak:tmp r.v
execute store result storage tierbreak:tmp r.p int 1 run scoreboard players get #pos tb.calc
# Relleno con puntos para que los íconos queden más o menos alineados
scoreboard players set #pad tb.calc 18
execute store result score #len tb.calc run data get storage tierbreak:tmp r.n
scoreboard players operation #pad tb.calc -= #len tb.calc
execute if score #pos tb.calc matches 10.. run scoreboard players remove #pad tb.calc 1
execute if score #pos tb.calc matches 100.. run scoreboard players remove #pad tb.calc 1
execute if score #pad tb.calc matches ..0 run scoreboard players set #pad tb.calc 0
execute store result storage tierbreak:tmp r.k int 1 run scoreboard players get #pad tb.calc
function tierbreak:admin/row_build with storage tierbreak:tmp r
