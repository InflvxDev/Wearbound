# Panel de admin: todos los jugadores registrados, ordenados por progreso.
# El diálogo se arma en storage wearbound:tmp ui y se muestra con una macro.
execute as @a run function wearbound:player/register

# Junta y ordena (de mayor a menor progreso)
data modify storage wearbound:tmp sorted set value []
data modify storage wearbound:tmp queue set from storage wearbound:players list
execute if data storage wearbound:tmp queue[0] run function wearbound:admin/collect

data modify storage wearbound:tmp ui set value {type:"minecraft:multi_action",title:{text:"Wearbound",color:"gold",bold:true},external_title:{text:"Wearbound",color:"gold"},body:[],columns:1,pause:false,after_action:"wait_for_response",actions:[{label:{text:"Actualizar",color:"green"},action:{type:"minecraft:run_command",command:"trigger wb.admin set 1"}}]}

# Cabecera
execute store result score #total wb.calc run data get storage wearbound:tmp sorted
data modify storage wearbound:tmp h set value {}
execute store result storage wearbound:tmp h.k int 1 run scoreboard players get #total wb.calc
function wearbound:admin/header with storage wearbound:tmp h
execute if score #total wb.calc matches 0 run data modify storage wearbound:tmp ui.body append value {type:"minecraft:plain_message",contents:{text:"Todavía no hay jugadores registrados.",color:"gray",italic:true}}

# Filas (máximo 100)
scoreboard players set #pos wb.calc 0
execute if data storage wearbound:tmp sorted[0] run function wearbound:admin/row_loop

function wearbound:admin/show with storage wearbound:tmp
