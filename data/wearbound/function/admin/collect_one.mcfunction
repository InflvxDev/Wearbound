# Interno: {n}. Inserta {n, v} en "sorted" en su posición (búsqueda binaria).
$function wearbound:gen/total {n:"$(n)"}
data modify storage wearbound:tmp row set value {n:"",v:0,id:0}
data modify storage wearbound:tmp row.id set from storage wearbound:tmp a.id
data modify storage wearbound:tmp row.n set from storage wearbound:tmp a.n
execute store result storage wearbound:tmp row.v int 1 run scoreboard players get #v wb.calc
scoreboard players set #lo wb.calc 0
execute store result score #hi wb.calc run data get storage wearbound:tmp sorted
function wearbound:admin/bsearch
execute store result storage wearbound:tmp b.i int 1 run scoreboard players get #lo wb.calc
function wearbound:admin/insert with storage wearbound:tmp b
