# Jugador nuevo o que volvió a entrar
execute as @a unless score @s wb.leave matches 0 run function wearbound:player/login

execute as @a run function wearbound:player/tick

# Botones del panel de admin (van por /trigger, así no sale la confirmación de comandos)
execute as @a[scores={wb.admin=1..}] run function wearbound:admin/trigger
