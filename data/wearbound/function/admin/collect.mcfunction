# Interno: procesa queue[0] y sigue (recursivo)
data modify storage wearbound:tmp a set value {}
data modify storage wearbound:tmp a.n set from storage wearbound:tmp queue[0].n
data modify storage wearbound:tmp a.id set from storage wearbound:tmp queue[0].id
function wearbound:admin/collect_one with storage wearbound:tmp a
data remove storage wearbound:tmp queue[0]
execute if data storage wearbound:tmp queue[0] run function wearbound:admin/collect
