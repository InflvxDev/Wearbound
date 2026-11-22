# Interno: cada tick, para quien tiene el permiso del panel.
# Un datapack no puede saber si sigue siendo OP, por eso el permiso caduca.
scoreboard players remove @s wb.time 1
execute unless score @s wb.time matches 1.. run function wearbound:admin/revoke
