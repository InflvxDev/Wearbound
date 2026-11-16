# GENERADO por tools/generate.py - no editar a mano
# Interno: agrega un ítem por tipo al detalle
data modify storage wearbound:tmp ui.body append value {type:"minecraft:plain_message",width:300,contents:{text:"Herramientas y armas",color:"gold",bold:true}}
$data modify storage wearbound:tmp ui.body append from storage wearbound:db detail.sword[$(sword)]
$data modify storage wearbound:tmp ui.body append from storage wearbound:db detail.axe[$(axe)]
$data modify storage wearbound:tmp ui.body append from storage wearbound:db detail.pickaxe[$(pickaxe)]
$data modify storage wearbound:tmp ui.body append from storage wearbound:db detail.shovel[$(shovel)]
$data modify storage wearbound:tmp ui.body append from storage wearbound:db detail.hoe[$(hoe)]
$data modify storage wearbound:tmp ui.body append from storage wearbound:db detail.spear[$(spear)]
data modify storage wearbound:tmp ui.body append value {type:"minecraft:plain_message",width:300,contents:{text:"Armadura",color:"gold",bold:true}}
$data modify storage wearbound:tmp ui.body append from storage wearbound:db detail.helmet[$(helmet)]
$data modify storage wearbound:tmp ui.body append from storage wearbound:db detail.chestplate[$(chestplate)]
$data modify storage wearbound:tmp ui.body append from storage wearbound:db detail.leggings[$(leggings)]
$data modify storage wearbound:tmp ui.body append from storage wearbound:db detail.boots[$(boots)]
