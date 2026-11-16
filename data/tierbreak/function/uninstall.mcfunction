# Desinstalar: /function tierbreak:uninstall y después quitar el datapack
execute as @a run attribute @s minecraft:block_break_speed modifier remove tierbreak:lock
execute as @a run attribute @s minecraft:attack_damage modifier remove tierbreak:lock
execute as @a run attribute @s minecraft:entity_interaction_range modifier remove tierbreak:lock
execute as @a run attribute @s minecraft:block_interaction_range modifier remove tierbreak:lock
function tierbreak:gen/uninstall
scoreboard objectives remove tb.calc
scoreboard objectives remove tb.leave
scoreboard objectives remove tb.seen
scoreboard objectives remove tb.lock
scoreboard objectives remove tb.cd
scoreboard objectives remove tb.acd
data remove storage tierbreak:db icons
data remove storage tierbreak:db detail
data remove storage tierbreak:db pads
data remove storage tierbreak:db max
data remove storage tierbreak:players list
data remove storage tierbreak:tmp ui
tellraw @s {text:"Tier Break desinstalado. Ahora quita el datapack de la carpeta datapacks y usa /reload.",color:"green"}
