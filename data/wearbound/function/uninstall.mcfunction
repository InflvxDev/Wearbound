# Desinstalar: /function wearbound:uninstall y después quitar el datapack
execute as @a run attribute @s minecraft:block_break_speed modifier remove wearbound:lock
execute as @a run attribute @s minecraft:attack_damage modifier remove wearbound:lock
execute as @a run attribute @s minecraft:entity_interaction_range modifier remove wearbound:lock
execute as @a run attribute @s minecraft:block_interaction_range modifier remove wearbound:lock
function wearbound:gen/uninstall
scoreboard objectives remove wb.calc
scoreboard objectives remove wb.leave
scoreboard objectives remove wb.seen
scoreboard objectives remove wb.mode
scoreboard objectives remove wb.pick
scoreboard objectives remove wb.ask
scoreboard objectives remove wb.lock
scoreboard objectives remove wb.cd
scoreboard objectives remove wb.acd
scoreboard objectives remove wb.admin
scoreboard objectives remove wb.time
tag @a remove wb.admin
data remove storage wearbound:db icons
data remove storage wearbound:db detail
data remove storage wearbound:db pads
data remove storage wearbound:db max
data remove storage wearbound:players list
data remove storage wearbound:tmp ui
tellraw @s {text:"Wearbound desinstalado. Ahora quita el datapack de la carpeta datapacks y usa /reload.",color:"green"}
