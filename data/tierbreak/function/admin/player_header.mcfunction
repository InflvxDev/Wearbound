# Interno: {v, m} línea de progreso del detalle
$data modify storage tierbreak:tmp ui.body append value {type:"minecraft:plain_message",width:300,contents:[{text:"Progreso: ",color:"gray"},{text:"$(v)/$(m)",color:"white",bold:true},{text:" tiers desbloqueados",color:"gray"}]}
