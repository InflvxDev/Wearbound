# Jugador nuevo o que volvió a entrar
execute as @a unless score @s tb.leave matches 0 run function tierbreak:player/login

execute as @a run function tierbreak:player/tick
