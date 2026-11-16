# Detalle de un jugador: /function wearbound:admin/player {n:"Steve"}
# Muestra el ítem del mejor tier de cada tipo y qué tiene que romper después.
$execute unless data storage wearbound:players list[{n:"$(n)"}] run return run tellraw @s {text:"No hay ningún jugador registrado con el nombre \"$(n)\".",color:"red"}
tag @s add wb.admin
scoreboard players enable @s wb.admin

# Valores del trigger para los botones: d = detalle, m = desbloquear todo, r = reiniciar
$data modify storage wearbound:tmp pd set from storage wearbound:players list[{n:"$(n)"}]
execute store result score #id wb.calc run data get storage wearbound:tmp pd.id
execute store result storage wearbound:tmp pd.d int 1 run scoreboard players add #id wb.calc 100000
execute store result storage wearbound:tmp pd.m int 1 run scoreboard players add #id wb.calc 100000
execute store result storage wearbound:tmp pd.r int 1 run scoreboard players add #id wb.calc 100000
function wearbound:admin/player_ui with storage wearbound:tmp pd


# Progreso total
$function wearbound:gen/total {n:"$(n)"}
data modify storage wearbound:tmp h set value {}
execute store result storage wearbound:tmp h.v int 1 run scoreboard players get #v wb.calc
data modify storage wearbound:tmp h.m set from storage wearbound:db max
function wearbound:admin/player_header with storage wearbound:tmp h
$execute if score $(n) wb.mode matches 2 run data modify storage wearbound:tmp ui.body append value {type:"minecraft:plain_message",width:300,contents:{text:"Eligió progresión vanilla: tiene todo desbloqueado.",color:"green"}}
$execute unless score $(n) wb.seen matches 1 run data modify storage wearbound:tmp ui.body append value {type:"minecraft:plain_message",width:300,contents:{text:"Todavía no eligió su progresión.",color:"gray",italic:true}}

# Un ítem por tipo
$function wearbound:gen/detail {n:"$(n)"}
function wearbound:admin/show with storage wearbound:tmp
