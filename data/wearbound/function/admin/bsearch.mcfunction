# Interno: busca la primera posición cuyo valor sea menor que #v
execute if score #lo wb.calc >= #hi wb.calc run return 0
scoreboard players operation #mid wb.calc = #lo wb.calc
scoreboard players operation #mid wb.calc += #hi wb.calc
scoreboard players operation #mid wb.calc /= #2 wb.calc
execute store result storage wearbound:tmp b.m int 1 run scoreboard players get #mid wb.calc
function wearbound:admin/mid with storage wearbound:tmp b
execute if score #m wb.calc >= #v wb.calc run scoreboard players operation #lo wb.calc = #mid wb.calc
execute if score #m wb.calc >= #v wb.calc run scoreboard players add #lo wb.calc 1
execute if score #m wb.calc < #v wb.calc run scoreboard players operation #hi wb.calc = #mid wb.calc
function wearbound:admin/bsearch
