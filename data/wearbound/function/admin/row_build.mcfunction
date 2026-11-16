# Interno: {p, n, v, m, k, d}
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
data modify storage wearbound:tmp ui.body append from storage wearbound:tmp line
