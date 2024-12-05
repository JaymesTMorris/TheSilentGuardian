extends Node

# Declare upgradeable stats with their initial values and increment rules
var HealAmount: float = 10 # +1, max 25
var MaxHealth: float = 500 # +50
var ManaRegen: float = 0.1 # +0.025, max 0.5
var MaxMana: float = 100 # +20
var TowerRange: float = 200 # +50
var TowerDamage: float = 5 # +5
var TowerAtkSpd: float = 0.5 # -0.025, min 0.1

# Functions to increment stats
func incrementHealAmount() -> void:
	if HealAmount < 25:
		HealAmount += 1
		print("HealAmount incremented to ", HealAmount)
	else:
		print("HealAmount is already at the maximum value of 25.")

func incrementMaxHealth() -> void:
	MaxHealth += 50
	print("MaxHealth incremented to ", MaxHealth)

func incrementManaRegen() -> void:
	if ManaRegen < 0.5:
		ManaRegen += 0.025
		print("ManaRegen incremented to ", ManaRegen)
	else:
		print("ManaRegen is already at the maximum value of 0.5.")

func incrementMaxMana() -> void:
	MaxMana += 20
	print("MaxMana incremented to ", MaxMana)

func incrementTowerRange() -> void:
	TowerRange += 50
	print("TowerRange incremented to ", TowerRange)

func incrementTowerDamage() -> void:
	TowerDamage += 5
	print("TowerDamage incremented to ", TowerDamage)

func incrementTowerAtkSpd() -> void:
	if TowerAtkSpd > 0.1:
		TowerAtkSpd -= 0.025
		print("TowerAtkSpd decreased to ", TowerAtkSpd)
	else:
		print("TowerAtkSpd is already at the minimum value of 0.1.")
