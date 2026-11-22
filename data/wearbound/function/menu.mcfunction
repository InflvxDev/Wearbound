# Panel de admin: /function wearbound:menu (requiere OP)
# Marca a @s como admin por 2 minutos desde el último botón: así los botones del panel
# pueden usar /trigger wb.admin (sin la pantalla de "Confirm Command Execution").
execute unless function wearbound:admin/grant run return fail
function wearbound:admin/list
