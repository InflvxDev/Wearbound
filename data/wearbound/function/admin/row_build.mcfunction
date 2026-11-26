# Interno: {p, n, v, m, k, d, u, c}
$data modify storage wearbound:tmp line set value {type:"minecraft:plain_message",width:400,contents:{text:"",extra:[{text:"$(p). ",color:"gray",bold:true},{type:"object",object:"player",player:{name:"$(n)"}},{text:" $(n)",color:"white",click_event:{action:"run_command",command:"/trigger wb.admin set $(d)"},hover_event:{action:"show_text",value:{text:"Ver el detalle de $(n)",color:"gray"}}},{text:"",color:"dark_gray"},{text:" "}]}}
$data modify storage wearbound:tmp line.contents.extra[3].text set from storage wearbound:db pads[$(k)]
# Un ícono por tipo con el mejor tier que puede usar
$function wearbound:gen/row_icons {n:"$(n)"}
$data modify storage wearbound:tmp line.contents.extra append value {text:" $(v)/$(m)",color:"gray"}
# Oro, plata y bronce para el top 3; progreso completo en dorado
execute if score #pos wb.calc matches 1 run data modify storage wearbound:tmp line.contents.extra[0].color set value "#FFD700"
execute if score #pos wb.calc matches 2 run data modify storage wearbound:tmp line.contents.extra[0].color set value "#C0C0C0"
execute if score #pos wb.calc matches 3 run data modify storage wearbound:tmp line.contents.extra[0].color set value "#CD7F32"
$execute if score #v wb.calc matches $(m).. run data modify storage wearbound:tmp line.contents.extra[-1].color set value "gold"
# Quien eligió vanilla sale marcado en vez de con su progreso
$execute if score $(n) wb.mode matches 2 run data modify storage wearbound:tmp line.contents.extra[-1] set value {text:" Vanilla",color:"green"}
# Botones: desbloquear todo y reiniciar (este pide confirmación)
$data modify storage wearbound:tmp line.contents.extra append value {text:"  [⬆]",color:"aqua",click_event:{action:"run_command",command:"/trigger wb.admin set $(u)"},hover_event:{action:"show_text",value:{text:"Desbloquear todo a $(n)",color:"gray"}}}
$data modify storage wearbound:tmp line.contents.extra append value {text:" [↺]",color:"red",click_event:{action:"run_command",command:"/trigger wb.admin set $(c)"},hover_event:{action:"show_text",value:{text:"Reiniciar a $(n)",color:"gray"}}}
data modify storage wearbound:tmp ui.body append from storage wearbound:tmp line
