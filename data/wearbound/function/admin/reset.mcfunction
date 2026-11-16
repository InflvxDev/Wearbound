# Uso: /function wearbound:admin/reset {n:"Steve"}  (vuelve a madera y cuero)
$execute unless data storage wearbound:players list[{n:"$(n)"}] run return run tellraw @s {text:"No hay ningún jugador registrado con el nombre \"$(n)\".",color:"red"}
$function wearbound:gen/set_all {n:"$(n)",t:0,a:0}
# Si había elegido vanilla, pasa a Wearbound
$scoreboard players set $(n) wb.mode 1
$tellraw @s [{text:"",color:"green"},{text:"Progreso de ",color:"green"},{text:"$(n)",color:"white"},{text:" reiniciado.",color:"green"}]
$tellraw $(n) [{text:"",color:"red"},{text:"Un admin reinició tu progreso: vuelves a madera y cuero.",color:"red"}]
$function wearbound:admin/player {n:"$(n)"}
