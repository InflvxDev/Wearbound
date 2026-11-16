# Wearbound

Progresión por roturas para SMP (Minecraft 26.4): para usar un material **tienes que romper antes uno del material anterior, del mismo tipo**.

| Tipo | Progresión |
|---|---|
| Espada, hacha, pico, pala, azada y lanza | madera, piedra, cobre, hierro, diamante |
| Casco, pechera, pantalones y botas (pieza por pieza) | cuero, cobre, hierro **o** cota de malla, diamante |
| Netherita | la de cada tipo necesita su tier de diamante desbloqueado |
| Oro | sin restricciones |

Ejemplos: para usar un **pico de cobre** hay que haber roto un **pico de piedra**. Para ponerse **botas de hierro** hay que haber roto unas **botas de cobre**. Para el **casco de diamante** sirve romper un casco de hierro **o** uno de cota de malla.

## Cómo se bloquea
- **Herramientas y armas:** se pueden tener en el inventario, pero si se sostienen (en cualquiera de las dos manos) el jugador no puede minar, pegar ni usarlas (velocidad de minado, daño y alcance a 0). En la barra de acción sale qué tiene que romper para desbloquearla.
- **Armadura:** si se equipa una pieza bloqueada (a mano, con shift-clic o con un dispensador), vuelve sola al inventario y sale un mensaje con lo que hay que romper.
- Da igual cómo se consiguió el ítem: crafteado, de un cofre, de un aldeano o de un mob.
- Al romper algo sale el mensaje **¡Nuevo tier!** con lo que se desbloqueó y lo siguiente que hay que romper.
- Los jugadores en **creativo** o **espectador** no tienen restricciones.
- Cada jugador ve una explicación corta la primera vez que entra.

## Panel de admin
`/function wearbound:menu` (requiere OP) abre un diálogo con todos los jugadores (también los desconectados), ordenados por progreso:

`1. [cabeza] Jugador ..... [íconos de herramientas]  [íconos de armadura]  22/36`

- Cada ícono es el mejor tier que el jugador puede usar en ese tipo. Pasa el ratón por encima para ver el nombre del tier.
- **Toca un nombre** para ver el detalle: el ítem de cada tipo, su tier (por ejemplo 4/5) y qué tiene que romper después. Desde ahí puedes **Desbloquear todo** o **Reiniciar** su progreso.

- Se cierra con **Esc**.
- Los botones del panel usan `/trigger wb.admin` (como StatsCraft), así no aparece la pantalla de "Confirm Command Execution". Solo funcionan para quien abrió el panel con `/function wearbound:menu`, y ese permiso dura hasta que sale del servidor.

También por comando:
- `/function wearbound:admin/player {n:"Steve"}`: detalle de un jugador.
- `/function wearbound:admin/max {n:"Steve"}`: desbloquea todo.
- `/function wearbound:admin/reset {n:"Steve"}`: vuelve a madera y cuero.

## Notas
- Las roturas se cuentan **desde que se instala** el datapack. Lo roto antes no cuenta.
- Mientras el jugador sostiene algo bloqueado tampoco puede abrir puertas ni cofres ni poner bloques con la otra mano (el alcance queda en 0).
- Desinstalar: `/function wearbound:uninstall` y después quitar el datapack.

## Cambiar tipos o materiales
Edita las tablas de `tools/generate.py` y ejecuta `python tools/generate.py`.
Ese script regenera `function/gen/*` y los tags de `tags/item/`.
El ícono se genera con `python tools/icon.py`.
