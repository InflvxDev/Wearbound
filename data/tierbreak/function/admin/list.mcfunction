# Panel de admin: todos los jugadores registrados, ordenados por progreso.
# El diálogo se arma en storage tierbreak:tmp ui y se muestra con una macro.
execute as @a run function tierbreak:player/register

# Junta y ordena (de mayor a menor progreso)
data modify storage tierbreak:tmp sorted set value []
data modify storage tierbreak:tmp queue set from storage tierbreak:players list
execute if data storage tierbreak:tmp queue[0] run function tierbreak:admin/collect

data modify storage tierbreak:tmp ui set value {type:"minecraft:multi_action",title:{text:"Tier Break",color:"gold",bold:true},external_title:{text:"Tier Break",color:"gold"},body:[],columns:1,pause:false,after_action:"wait_for_response",actions:[{label:{text:"Actualizar",color:"green"},action:{type:"minecraft:run_command",command:"function tierbreak:menu"}}],exit_action:{label:"Cerrar"}}

# Cabecera
execute store result score #total tb.calc run data get storage tierbreak:tmp sorted
data modify storage tierbreak:tmp h set value {}
execute store result storage tierbreak:tmp h.k int 1 run scoreboard players get #total tb.calc
function tierbreak:admin/header with storage tierbreak:tmp h
execute if score #total tb.calc matches 0 run data modify storage tierbreak:tmp ui.body append value {type:"minecraft:plain_message",contents:{text:"Todavía no hay jugadores registrados.",color:"gray",italic:true}}

# Filas (máximo 100)
scoreboard players set #pos tb.calc 0
execute if data storage tierbreak:tmp sorted[0] run function tierbreak:admin/row_loop

function tierbreak:admin/show with storage tierbreak:tmp
