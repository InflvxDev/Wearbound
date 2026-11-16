# Uso: /function wearbound:admin/max {n:"Steve"}  (todo en diamante)
$execute unless data storage wearbound:players list[{n:"$(n)"}] run return run tellraw @s {text:"No hay ningún jugador registrado con el nombre \"$(n)\".",color:"red"}
$function wearbound:gen/set_all {n:"$(n)",t:4,a:3}
$tellraw @s [{text:"",color:"green"},{text:"$(n)",color:"white"},{text:" ya puede usar todos los tiers.",color:"green"}]
$tellraw $(n) [{text:"",color:"green"},{text:"Un admin te desbloqueó todos los tiers.",color:"green"}]
$function wearbound:admin/player {n:"$(n)"}
