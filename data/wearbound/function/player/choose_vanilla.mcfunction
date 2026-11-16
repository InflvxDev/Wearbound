# Interno: @s eligió la progresión vanilla: todo desbloqueado
scoreboard players set @s wb.mode 2
function wearbound:gen/max_self
tellraw @s [{text:""},{text:"Elegiste ",color:"gray"},{text:"Vanilla",color:"green",bold:true},{text:": puedes usar todo el equipo desde el principio.",color:"gray"}]
execute at @s run playsound minecraft:entity.player.levelup master @s ~ ~ ~ 0.8 1.0
