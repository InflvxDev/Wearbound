#!/usr/bin/env python3
"""Tier Break - genera pack.png (pixel art 64x64 escalado x4 = 256x256).

Un pico grande cuya cabeza recorre los 5 tiers (madera -> diamante) y cuyo
mango se está partiendo, con chispas y astillas de cada material.
Sin dependencias: escribe el PNG a mano con zlib.
Uso: python tools/icon.py
"""
import math
import os
import random
import struct
import zlib

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
N, SCALE = 64, 4
random.seed(7)


def hexc(h):
    h = h.lstrip("#")
    return tuple(int(h[i:i + 2], 16) for i in (0, 2, 4))


def mix(a, b, t):
    t = max(0.0, min(1.0, t))
    return tuple(round(a[i] + (b[i] - a[i]) * t) for i in range(3))


img = [[(0, 0, 0)] * N for _ in range(N)]


def px(x, y, c):
    if 0 <= x < N and 0 <= y < N:
        img[y][x] = c


def get(x, y):
    return img[max(0, min(N - 1, y))][max(0, min(N - 1, x))]


# --- Pico (máscara de capas) --------------------------------------------------
# Se dibuja en coordenadas propias y después se desplaza para quedar centrado.
BREAK = (22, 42)                       # punto donde se parte el mango
HEAD = (40, 22)                        # centro aproximado de la cabeza
layer = {}                             # (x, y) -> color

TIERS = [  # (luz, base, sombra) en orden desde la punta derecha a la de arriba
    ("#D8B37A", "#A87E46", "#6E5029"),   # madera
    ("#C8C8C8", "#929292", "#5C5C5C"),   # piedra
    ("#FFB38C", "#DB7348", "#93462A"),   # cobre
    ("#FFFFFF", "#D6D6D6", "#8F8F8F"),   # hierro
    ("#C6FFFA", "#47D9DE", "#1C8B95"),   # diamante
]
TIERS = [tuple(hexc(c) for c in t) for t in TIERS]
CX, CY = 15, 49                        # centro del arco (abajo a la izquierda)
A0, A1 = 4, 86                         # ángulos de las puntas

for y in range(N):
    for x in range(N):
        dx, dy = x - CX, CY - y
        r = math.hypot(dx, dy)
        a = math.degrees(math.atan2(dy, dx))
        if not (A0 <= a <= A1):
            continue
        u = (a - A0) / (A1 - A0)                       # 0 punta derecha -> 1 punta arriba
        thick = 1.2 + 4.3 * math.sin(math.pi * u) ** 0.8  # más gruesa al medio
        mid = 33.5
        if abs(r - mid) > thick:
            continue
        t = min(4, int(u * 5))
        hi, base, lo = TIERS[t]
        edge = (r - mid) / thick                        # -1 interior .. 1 exterior
        if edge > 0.45:
            c = hi
        elif edge < -0.45:
            c = lo
        else:
            c = base
        # costura entre materiales
        if abs(u * 5 - round(u * 5)) < 0.035 and 0 < round(u * 5) < 5:
            c = mix(lo, (10, 10, 20), 0.5)
        layer[(x, y)] = c

# Mango: a lo largo de x + y = 64, de abajo a la izquierda hasta la cabeza
WOOD_HI, WOOD, WOOD_LO = hexc("#C89458"), hexc("#8E5E2E"), hexc("#5A3A1C")
GAP = (-23, -18)                       # tramo del mango que se rompe (s = x - y)
handle = {}
for y in range(N):
    for x in range(N):
        p = x + y - 64
        s = x - y
        if abs(p) > 2 or not (-52 <= s <= 12) or GAP[0] <= s <= GAP[1]:
            continue
        c = WOOD_HI if p <= -1 else (WOOD_LO if p >= 2 else WOOD)
        if s < GAP[0]:                 # pedazo de abajo: cae un poco
            handle[(x - 2, y + 1)] = c
        else:
            handle[(x, y)] = c
for q, c in handle.items():
    layer.setdefault(q, c)             # la cabeza queda por delante del mango

# Bordes astillados de la rotura
for (x, y) in ((19, 44), (20, 45), (21, 43), (24, 39), (25, 41), (26, 40)):
    layer.pop((x, y), None)
for (x, y) in ((17, 48), (19, 47), (25, 38)):
    layer[(x, y)] = WOOD_HI

# Contorno oscuro alrededor del pico
OUT = hexc("#0A0812")
outline = set()
for (x, y) in layer:
    for ddx, ddy in ((1, 0), (-1, 0), (0, 1), (0, -1)):
        q = (x + ddx, y + ddy)
        if q not in layer:
            outline.add(q)

# --- Centrado: mueve todo el pico al centro del lienzo -----------------------
xs = [x for x, _ in outline]
ys = [y for _, y in outline]
OX = round((N - 1) / 2 - (min(xs) + max(xs)) / 2)
OY = round((N - 1) / 2 - (min(ys) + max(ys)) / 2)
layer = {(x + OX, y + OY): c for (x, y), c in layer.items()}
outline = {(x + OX, y + OY) for x, y in outline}
BREAK = (BREAK[0] + OX, BREAK[1] + OY)
HEAD = (HEAD[0] + OX, HEAD[1] + OY)

# --- Fondo -------------------------------------------------------------------
BG_A, BG_B = hexc("#0F1626"), hexc("#1C1430")
for y in range(N):
    for x in range(N):
        c = mix(BG_A, BG_B, (x + y) / (2 * N))
        # resplandor frío detrás de la cabeza
        d1 = math.hypot(x - HEAD[0], y - HEAD[1]) / 26
        if d1 < 1:
            c = mix(c, hexc("#1E3D52"), (1 - d1) ** 1.5 * 0.9)
        # resplandor cálido en la rotura
        d2 = math.hypot(x - BREAK[0], y - BREAK[1]) / 16
        if d2 < 1:
            c = mix(c, hexc("#5A3A22"), (1 - d2) ** 2 * 0.9)
        # tramado suave para que no quede plano
        if (x * 7 + y * 13) % 11 == 0:
            c = mix(c, (0, 0, 0), 0.12)
        img[y][x] = c

# Rayos de luz saliendo de la rotura
for a in range(0, 360, 30):
    r = math.radians(a + 15)
    for k in range(5, 14):
        x = round(BREAK[0] + math.cos(r) * k)
        y = round(BREAK[1] + math.sin(r) * k)
        if 2 <= x < N - 2 and 2 <= y < N - 2:
            px(x, y, mix(get(x, y), hexc("#8A5A2E"), 0.45 * (1 - (k - 5) / 9)))

for q in outline:
    px(*q, OUT)
for (x, y), c in layer.items():
    px(x, y, c)

# --- Chispas y astillas de cada material --------------------------------------
SPARK = [hexc("#FFF6C8"), hexc("#FFD45A"), hexc("#FF9F3A")]
for i in range(26):
    ang = random.uniform(0, 2 * math.pi)
    dist = random.uniform(3, 12)
    x = round(BREAK[0] + math.cos(ang) * dist)
    y = round(BREAK[1] + math.sin(ang) * dist)
    if (x, y) in layer or not (3 <= x < N - 3 and 3 <= y < N - 3):
        continue
    px(x, y, SPARK[i % 3])
# astillas (2 píxeles) de los 5 materiales volando
shards = [((9, 33), 0), ((13, 28), 1), ((31, 50), 2), ((36, 45), 3), ((8, 41), 4), ((28, 55), 0)]
for (x, y), t in shards:
    x, y = x + OX, y + OY
    if {(x, y), (x + 1, y), (x + 1, y + 1)} & (set(layer) | outline):
        continue
    hi, base, lo = TIERS[t]
    px(x, y, hi)
    px(x + 1, y, base)
    px(x + 1, y + 1, lo)
# destello en el centro de la rotura
bx, by = BREAK
for k, c in ((0, hexc("#FFFFFF")), (1, hexc("#FFF2B0")), (2, hexc("#FFC94A"))):
    for ddx, ddy in ((k, 0), (-k, 0), (0, k), (0, -k)):
        px(bx + ddx, by + ddy, c)

# Brillos en la cabeza de diamante y estrellas
WHITE, CYAN = hexc("#FFFFFF"), hexc("#B8FFFA")


PICK_PIXELS = set(layer) | outline


def star(x, y, c, size=1):
    # sin tapar el pico
    near = {(x + dx, y + dy) for dx in range(-size, size + 1) for dy in range(-size, size + 1)}
    if near & PICK_PIXELS:
        return
    px(x, y, c)
    for k in range(1, size + 1):
        for ddx, ddy in ((k, 0), (-k, 0), (0, k), (0, -k)):
            px(x + ddx, y + ddy, mix(c, get(x + ddx, y + ddy), 0.3 * k))


star(22, 13, WHITE, 2)
star(54, 9, CYAN, 2)
star(58, 30, WHITE, 1)
star(45, 52, CYAN, 1)
star(7, 8, WHITE, 1)
for x, y in ((35, 6), (60, 44), (5, 22), (50, 60), (40, 40)):
    if (x, y) not in PICK_PIXELS:
        px(x, y, mix(WHITE, get(x, y), 0.4))

# --- Marco -------------------------------------------------------------------
FRAME, FRAME_HI = hexc("#07060D"), hexc("#3B4A6B")
for i in range(N):
    for x, y in ((i, 0), (i, N - 1), (0, i), (N - 1, i)):
        px(x, y, FRAME)
for i in range(1, N - 1):
    for x, y in ((i, 1), (1, i)):
        px(x, y, FRAME_HI)
    for x, y in ((i, N - 2), (N - 2, i)):
        px(x, y, mix(FRAME_HI, FRAME, 0.5))

# --- Escribir PNG -------------------------------------------------------------
raw = bytearray()
for y in range(N * SCALE):
    raw.append(0)
    row = img[y // SCALE]
    for x in range(N * SCALE):
        raw.extend(row[x // SCALE])


def chunk(tag, data):
    c = struct.pack(">I", len(data)) + tag + data
    return c + struct.pack(">I", zlib.crc32(tag + data) & 0xFFFFFFFF)


png = b"\x89PNG\r\n\x1a\n"
png += chunk(b"IHDR", struct.pack(">IIBBBBB", N * SCALE, N * SCALE, 8, 2, 0, 0, 0))
png += chunk(b"IDAT", zlib.compress(bytes(raw), 9))
png += chunk(b"IEND", b"")
with open(os.path.join(ROOT, "pack.png"), "wb") as f:
    f.write(png)
print("pack.png generado")
