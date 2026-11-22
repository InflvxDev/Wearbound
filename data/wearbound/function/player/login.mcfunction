# Interno: @s acaba de entrar (o se recargó el datapack)
scoreboard players set @s wb.leave 0
# El permiso del panel no sobrevive a salir ni a /reload
function wearbound:admin/revoke
function wearbound:gen/init
function wearbound:player/register
# Por si salió con una herramienta bloqueada en la mano
scoreboard players set @s wb.lock 1
function wearbound:lock/off
# Primera vez: en 2 segundos se le pregunta qué progresión quiere
execute unless score @s wb.seen matches 1 run scoreboard players set @s wb.ask 40
