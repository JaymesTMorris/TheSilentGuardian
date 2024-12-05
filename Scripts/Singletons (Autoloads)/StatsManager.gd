extends Node

# Declare upgradeable stats with their initial values and increment rules
var HealAmount: float = 10 # +1, max 25
#MaxHealth from HealthManager.gd +50
var ManaRegen: float = 0.1 # +0.025, max 0.5
var MaxMana: float = 75 # +20
var TowerRange: float = 250 # +50
var TowerDamage: float = 20 # +5
var TowerAtkSpd: float = 0.5 # -0.025, min 0.1

# Functions to increment stats
func incrementHealAmount() -> void:
	if CurrencyManager.spendCurrency(50):
		if HealAmount < 25:
			HealAmount += 1
			print("HealAmount incremented to ", HealAmount)
		else:
			print("HealAmount is already at the maximum value of 25.")
		UIManager.updateUpgradesLabels()

func incrementMaxHealth() -> void:
	if CurrencyManager.spendCurrency(50):
		HealthManager.maxHealth += 50
		print("MaxHealth incremented to ", HealthManager.maxHealth)
		UIManager.updateUpgradesLabels()

func incrementManaRegen() -> void:
	if CurrencyManager.spendCurrency(50):
		if ManaRegen < 0.5:
			ManaRegen += 0.025
			print("ManaRegen incremented to ", ManaRegen)
		else:
			print("ManaRegen is already at the maximum value of 0.5.")
		UIManager.updateUpgradesLabels()

func incrementMaxMana() -> void:
	if CurrencyManager.spendCurrency(50):
		MaxMana += 20
		print("MaxMana incremented to ", MaxMana)
		UIManager.updateUpgradesLabels()

func incrementTowerRange() -> void:
	if CurrencyManager.spendCurrency(50):
		TowerRange += 50
		print("TowerRange incremented to ", TowerRange)
		UIManager.updateUpgradesLabels()

func incrementTowerDamage() -> void:
	if CurrencyManager.spendCurrency(50):
		TowerDamage += 5
		print("TowerDamage incremented to ", TowerDamage)
		UIManager.updateUpgradesLabels()

func incrementTowerAtkSpd() -> void:
	if CurrencyManager.spendCurrency(50):
		if TowerAtkSpd > 0.1:
			TowerAtkSpd -= 0.025
			print("TowerAtkSpd decreased to ", TowerAtkSpd)
		else:
			print("TowerAtkSpd is already at the minimum value of 0.1.")
		UIManager.updateUpgradesLabels()

func heal() -> void:
	if CurrencyManager.spendCurrency(50):
		HealthManager.heal(HealAmount)
