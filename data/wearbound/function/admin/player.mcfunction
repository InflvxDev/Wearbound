# Detalle de un jugador: /function tierbreak:admin/player {n:"Steve"}
# Muestra el ítem del mejor tier de cada tipo y qué tiene que romper después.
$execute unless data storage tierbreak:players list[{n:"$(n)"}] run return run tellraw @s {text:"No hay ningún jugador registrado con el nombre \"$(n)\".",color:"red"}

$data modify storage tierbreak:tmp ui set value {type:"minecraft:multi_action",title:{text:"",extra:[{type:"object",object:"player",player:{name:"$(n)"}},{text:" $(n)",color:"gold",bold:true}]},body:[],columns:3,pause:false,after_action:"wait_for_response",actions:[{label:{text:"Actualizar",color:"green"},action:{type:"minecraft:run_command",command:'function tierbreak:admin/player {n:"$(n)"}'}},{label:{text:"Desbloquear todo",color:"aqua"},tooltip:{text:"Pone todos sus tiers en diamante"},action:{type:"minecraft:run_command",command:'function tierbreak:admin/max {n:"$(n)"}'}},{label:{text:"Reiniciar",color:"red"},tooltip:{text:"Vuelve a empezar desde madera y cuero"},action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:confirmation",title:{text:"Reiniciar progreso",color:"red",bold:true},body:{type:"minecraft:plain_message",contents:{text:"$(n) volverá a empezar desde madera y cuero. No se puede deshacer.",color:"gray"}},pause:false,yes:{label:{text:"Reiniciar",color:"red"},action:{type:"minecraft:run_command",command:'function tierbreak:admin/reset {n:"$(n)"}'}},no:{label:"Volver",action:{type:"minecraft:run_command",command:'function tierbreak:admin/player {n:"$(n)"}'}}}}}],exit_action:{label:"Volver",action:{type:"minecraft:run_command",command:"function tierbreak:menu"}}}

# Progreso total
$function tierbreak:gen/total {n:"$(n)"}
data modify storage tierbreak:tmp h set value {}
execute store result storage tierbreak:tmp h.v int 1 run scoreboard players get #v tb.calc
data modify storage tierbreak:tmp h.m set from storage tierbreak:db max
function tierbreak:admin/player_header with storage tierbreak:tmp h

# Un ítem por tipo
$function tierbreak:gen/detail {n:"$(n)"}
function tierbreak:admin/show with storage tierbreak:tmp
