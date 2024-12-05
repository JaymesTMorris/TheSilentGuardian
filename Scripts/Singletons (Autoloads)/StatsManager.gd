extends Node

signal attack_speed_updated

# Declare upgradeable stats with their initial values and increment rules
var HealAmount: float = 10 # +1, max 25
#MaxHealth from HealthManager.gd +50
var ManaRegen: float = 0.1 # +0.025, max 0.5
var MaxMana: float =100 # +20
var TowerRange: float = 250 # +50
var TowerDamage: float = 20 # +5
var TowerAtkSpd: float = 0.5 # -0.025, min 0.1
var MaxTowers: int = 5 # +1, 10 max
var TowersPlaced: int = 0

var isMaxTowersMaxed: bool = false
var isManaRegenMaxed: bool = false
var isTowerAtkSpdMaxed: bool = false

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
	if ManaRegen >= 0.5:
		print("ManaRegen is already at the maximum value of 0.5.")
		isManaRegenMaxed = true
		return
	if CurrencyManager.spendCurrency(50):
		ManaRegen += 0.025
		print("ManaRegen incremented to ", ManaRegen)
		if ManaRegen >= 0.5:
			isManaRegenMaxed = true
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
	if TowerAtkSpd <= 0.1:
		print("TowerAtkSpd is already at the minimum value of 0.1.")
		isTowerAtkSpdMaxed = true
		return
	if CurrencyManager.spendCurrency(50):
		TowerAtkSpd -= 0.025
		print("TowerAtkSpd decreased to ", TowerAtkSpd)
		emit_signal("attack_speed_updated")
		if TowerAtkSpd <= 0.1:
				isTowerAtkSpdMaxed = true
		UIManager.updateUpgradesLabels()

func heal() -> void:
	if CurrencyManager.spendCurrency(50):
		HealthManager.heal(HealAmount)
		
func incrementMaxTowers() -> void:
	if MaxTowers <= 9:
		if CurrencyManager.spendCurrency(50):
			MaxTowers += 1
			print("Max Towers Increased to ", MaxTowers)
			if MaxTowers == 10:
				isMaxTowersMaxed = true
			UIManager.updateUpgradesLabels()
	else:
		print("Max Towers is already at the maximum value of 10.")
	
