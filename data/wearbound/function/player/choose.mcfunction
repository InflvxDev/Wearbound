# Interno: @s tocó un botón del diálogo de la primera vez (/trigger wb.pick)
#   1 = Wearbound, 2 = vanilla
scoreboard players operation #p wb.calc = @s wb.pick
scoreboard players reset @s wb.pick
# Solo se puede elegir una vez
execute if score @s wb.seen matches 1 run return 0
execute unless score #p wb.calc matches 1..2 run return run scoreboard players enable @s wb.pick
scoreboard players set @s wb.seen 1
scoreboard players reset @s wb.ask
execute if score #p wb.calc matches 1 run function wearbound:player/choose_wearbound
execute if score #p wb.calc matches 2 run function wearbound:player/choose_vanilla
