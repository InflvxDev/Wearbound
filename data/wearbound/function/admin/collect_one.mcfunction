# Interno: {n}. Inserta {n, v} en "sorted" en su posición (búsqueda binaria).
$function tierbreak:gen/total {n:"$(n)"}
data modify storage tierbreak:tmp row set value {n:"",v:0}
data modify storage tierbreak:tmp row.n set from storage tierbreak:tmp a.n
execute store result storage tierbreak:tmp row.v int 1 run scoreboard players get #v tb.calc
scoreboard players set #lo tb.calc 0
execute store result score #hi tb.calc run data get storage tierbreak:tmp sorted
function tierbreak:admin/bsearch
execute store result storage tierbreak:tmp b.i int 1 run scoreboard players get #lo tb.calc
function tierbreak:admin/insert with storage tierbreak:tmp b
