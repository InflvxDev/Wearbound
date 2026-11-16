# Interno: procesa sorted[0] y sigue (recursivo)
scoreboard players add #pos tb.calc 1
execute if score #pos tb.calc matches ..100 run function tierbreak:admin/row
data remove storage tierbreak:tmp sorted[0]
execute if data storage tierbreak:tmp sorted[0] run function tierbreak:admin/row_loop
