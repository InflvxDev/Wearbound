# GENERADO por tools/generate.py - no editar a mano
# Interno: agrega un ítem por tipo al detalle
data modify storage tierbreak:tmp ui.body append value {type:"minecraft:plain_message",width:300,contents:{text:"Herramientas y armas",color:"gold",bold:true}}
$data modify storage tierbreak:tmp ui.body append from storage tierbreak:db detail.sword[$(sword)]
$data modify storage tierbreak:tmp ui.body append from storage tierbreak:db detail.axe[$(axe)]
$data modify storage tierbreak:tmp ui.body append from storage tierbreak:db detail.pickaxe[$(pickaxe)]
$data modify storage tierbreak:tmp ui.body append from storage tierbreak:db detail.shovel[$(shovel)]
$data modify storage tierbreak:tmp ui.body append from storage tierbreak:db detail.hoe[$(hoe)]
$data modify storage tierbreak:tmp ui.body append from storage tierbreak:db detail.spear[$(spear)]
data modify storage tierbreak:tmp ui.body append value {type:"minecraft:plain_message",width:300,contents:{text:"Armadura",color:"gold",bold:true}}
$data modify storage tierbreak:tmp ui.body append from storage tierbreak:db detail.helmet[$(helmet)]
$data modify storage tierbreak:tmp ui.body append from storage tierbreak:db detail.chestplate[$(chestplate)]
$data modify storage tierbreak:tmp ui.body append from storage tierbreak:db detail.leggings[$(leggings)]
$data modify storage tierbreak:tmp ui.body append from storage tierbreak:db detail.boots[$(boots)]
