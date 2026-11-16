# GENERADO por tools/generate.py - no editar a mano
# Interno: #v tb.calc = tiers desbloqueados en total por el jugador $(n)
scoreboard players set #v tb.calc 0
$execute store result score #x tb.calc run scoreboard players get $(n) tb.sword
scoreboard players operation #v tb.calc += #x tb.calc
$execute store result score #x tb.calc run scoreboard players get $(n) tb.axe
scoreboard players operation #v tb.calc += #x tb.calc
$execute store result score #x tb.calc run scoreboard players get $(n) tb.pickaxe
scoreboard players operation #v tb.calc += #x tb.calc
$execute store result score #x tb.calc run scoreboard players get $(n) tb.shovel
scoreboard players operation #v tb.calc += #x tb.calc
$execute store result score #x tb.calc run scoreboard players get $(n) tb.hoe
scoreboard players operation #v tb.calc += #x tb.calc
$execute store result score #x tb.calc run scoreboard players get $(n) tb.spear
scoreboard players operation #v tb.calc += #x tb.calc
$execute store result score #x tb.calc run scoreboard players get $(n) tb.helmet
scoreboard players operation #v tb.calc += #x tb.calc
$execute store result score #x tb.calc run scoreboard players get $(n) tb.chestplate
scoreboard players operation #v tb.calc += #x tb.calc
$execute store result score #x tb.calc run scoreboard players get $(n) tb.leggings
scoreboard players operation #v tb.calc += #x tb.calc
$execute store result score #x tb.calc run scoreboard players get $(n) tb.boots
scoreboard players operation #v tb.calc += #x tb.calc
