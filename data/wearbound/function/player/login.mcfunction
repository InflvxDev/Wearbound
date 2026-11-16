# Interno: @s acaba de entrar (o se recargó el datapack)
scoreboard players set @s tb.leave 0
function tierbreak:gen/init
function tierbreak:player/register
# Por si salió con una herramienta bloqueada en la mano
scoreboard players set @s tb.lock 1
function tierbreak:lock/off
execute unless score @s tb.seen matches 1 run function tierbreak:gen/welcome
