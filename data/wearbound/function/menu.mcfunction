# Panel de admin: /function wearbound:menu (requiere OP)
# Marca a @s como admin hasta que salga del servidor: así los botones del panel
# pueden usar /trigger wb.admin (sin la pantalla de "Confirm Command Execution").
tag @s add wb.admin
scoreboard players enable @s wb.admin
function wearbound:admin/list
