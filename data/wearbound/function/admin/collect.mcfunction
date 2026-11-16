# Interno: procesa queue[0] y sigue (recursivo)
data modify storage tierbreak:tmp a set value {}
data modify storage tierbreak:tmp a.n set from storage tierbreak:tmp queue[0].n
function tierbreak:admin/collect_one with storage tierbreak:tmp a
data remove storage tierbreak:tmp queue[0]
execute if data storage tierbreak:tmp queue[0] run function tierbreak:admin/collect
