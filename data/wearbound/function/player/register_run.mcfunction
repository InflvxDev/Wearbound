# Interno: {n, u}. Si el UUID ya estaba, solo actualiza el nombre (cambio de nick).
$execute if data storage tierbreak:players list[{u:$(u)}] run return run data modify storage tierbreak:players list[{u:$(u)}].n set value "$(n)"
$data modify storage tierbreak:players list append value {n:"$(n)",u:$(u)}
