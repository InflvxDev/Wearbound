# Interno: busca la primera posición cuyo valor sea menor que #v
execute if score #lo tb.calc >= #hi tb.calc run return 0
scoreboard players operation #mid tb.calc = #lo tb.calc
scoreboard players operation #mid tb.calc += #hi tb.calc
scoreboard players operation #mid tb.calc /= #2 tb.calc
execute store result storage tierbreak:tmp b.m int 1 run scoreboard players get #mid tb.calc
function tierbreak:admin/mid with storage tierbreak:tmp b
execute if score #m tb.calc >= #v tb.calc run scoreboard players operation #lo tb.calc = #mid tb.calc
execute if score #m tb.calc >= #v tb.calc run scoreboard players add #lo tb.calc 1
execute if score #m tb.calc < #v tb.calc run scoreboard players operation #hi tb.calc = #mid tb.calc
function tierbreak:admin/bsearch
