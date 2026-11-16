# Interno: @s tocó un botón del panel (/trigger wb.admin set <acción>)
#   1 = lista, 100000+id = detalle, 200000+id = desbloquear todo, 300000+id = reiniciar
scoreboard players operation #t wb.calc = @s wb.admin
scoreboard players set @s wb.admin 0
# Solo para quien abrió el panel con /function wearbound:menu (requiere OP)
execute unless entity @s[tag=wb.admin] run return run scoreboard players reset @s wb.admin
scoreboard players enable @s wb.admin
execute if score #t wb.calc matches 1 run return run function wearbound:admin/list
scoreboard players operation #op wb.calc = #t wb.calc
scoreboard players operation #op wb.calc /= #100000 wb.calc
scoreboard players operation #id wb.calc = #t wb.calc
scoreboard players operation #id wb.calc %= #100000 wb.calc
data modify storage wearbound:tmp sel set value {}
execute store result storage wearbound:tmp sel.id int 1 run scoreboard players get #id wb.calc
function wearbound:admin/by_id with storage wearbound:tmp sel
