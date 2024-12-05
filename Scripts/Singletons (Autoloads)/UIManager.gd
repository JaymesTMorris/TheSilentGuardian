extends Node

# Declare UI elements
var HealthBar: ProgressBar
var HealthDelayBar: ProgressBar
var ManaBar: ProgressBar
var ManaDelayBar: ProgressBar
var ScoreTextLabel: RichTextLabel
var NightProgressBar: ProgressBar
var CurrencyTextLabel: RichTextLabel
var WaveLabel: Label

# New UI elements
var Heal: Label
var HealAmount: Label
var MaxHealth: Label
var ManaRegen: Label
var MaxMana: Label
var TowerRange: Label
var TowerDamage: Label
var TowerAtkSpd: Label

func initializeUIElements() -> void:
	# Initialize core UI elements
	HealthBar = get_node_or_null("/root/Main/Player/CanvasLayer/UserInterface/HealthBar") as ProgressBar
	HealthDelayBar = get_node_or_null("/root/Main/Player/CanvasLayer/UserInterface/HealthBar/DelayBar") as ProgressBar
	ManaBar = get_node_or_null("/root/Main/Player/CanvasLayer/UserInterface/ManaBar") as ProgressBar
	ManaDelayBar = get_node_or_null("/root/Main/Player/CanvasLayer/UserInterface/ManaBar/DelayBar") as ProgressBar
	ScoreTextLabel = get_node_or_null("/root/Main/Player/CanvasLayer/UserInterface/ScoreRect/ScoreTextLabel") as RichTextLabel
	NightProgressBar = get_node_or_null("/root/Main/Player/CanvasLayer/UserInterface/NightProgressBar") as ProgressBar
	CurrencyTextLabel = get_node_or_null("/root/Main/Player/CanvasLayer/UserInterface/CurrencyRect/CurrencyTextLabel") as RichTextLabel
	WaveLabel = get_node_or_null("/root/Main/Player/CanvasLayer/UserInterface/WaveLabel") as Label
	
	# Initialize new UpgradeDetailsContainer UI elements
	Heal = get_node_or_null("/root/Main/Player/CanvasLayer/UserInterface/Upgrades/UpgradeDetailsContainer/Heal") as Label
	HealAmount = get_node_or_null("/root/Main/Player/CanvasLayer/UserInterface/Upgrades/UpgradeDetailsContainer/HealAmount") as Label
	MaxHealth = get_node_or_null("/root/Main/Player/CanvasLayer/UserInterface/Upgrades/UpgradeDetailsContainer/MaxHealth") as Label
	ManaRegen = get_node_or_null("/root/Main/Player/CanvasLayer/UserInterface/Upgrades/UpgradeDetailsContainer/ManaRegen") as Label
	MaxMana = get_node_or_null("/root/Main/Player/CanvasLayer/UserInterface/Upgrades/UpgradeDetailsContainer/MaxMana") as Label
	TowerRange = get_node_or_null("/root/Main/Player/CanvasLayer/UserInterface/Upgrades/UpgradeDetailsContainer/TowerRange") as Label
	TowerDamage = get_node_or_null("/root/Main/Player/CanvasLayer/UserInterface/Upgrades/UpgradeDetailsContainer/TowerDamage") as Label
	TowerAtkSpd = get_node_or_null("/root/Main/Player/CanvasLayer/UserInterface/Upgrades/UpgradeDetailsContainer/TowerAtkSpd") as Label
	
	logMissingUIElements()

func logMissingUIElements() -> void:
	# Helper function to log missing nodes
	if HealthBar == null: print("HealthBar is missing!")
	if HealthDelayBar == null: print("HealthDelayBar is missing!")
	if ManaBar == null: print("ManaBar is missing!")
	if ManaDelayBar == null: print("ManaDelayBar is missing!")
	if ScoreTextLabel == null: print("ScoreTextLabel is missing!")
	if NightProgressBar == null: print("NightProgressBar is missing!")
	if CurrencyTextLabel == null: print("CurrencyTextLabel is missing!")
	if WaveLabel == null: print("WaveLabel is missing!")
	if Heal == null: print("Heal is missing!")
	if HealAmount == null: print("HealAmount is missing!")
	if MaxHealth == null: print("MaxHealth is missing!")
	if ManaRegen == null: print("ManaRegen is missing!")
	if MaxMana == null: print("MaxMana is missing!")
	if TowerRange == null: print("TowerRange is missing!")
	if TowerDamage == null: print("TowerDamage is missing!")
	if TowerAtkSpd == null: print("TowerAtkSpd is missing!")

func updateHealthBar(value: float) -> void:
	if HealthBar == null or HealthDelayBar == null:
		print("Cannot update health bar: Missing elements.")
		return
	
	HealthDelayBar.value = HealthBar.value
	HealthBar.value = value
	
	while HealthDelayBar.value > HealthBar.value:
		if HealthBar == null or HealthDelayBar == null:
			print("HealthBar or HealthDelayBar became null!")
			return
		HealthDelayBar.value -= 1
		await get_tree().create_timer(0.01).timeout

func updateManaBar(value: float) -> void:
	if ManaBar == null or ManaDelayBar == null:
		print("Cannot update mana bar: Missing elements.")
		return
	
	ManaDelayBar.value = ManaBar.value
	ManaBar.value = value
	
	while ManaDelayBar.value > ManaBar.value:
		if ManaBar == null or ManaDelayBar == null:
			print("ManaBar or ManaDelayBar became null!")
			return
		ManaDelayBar.value -= 1
		await get_tree().create_timer(0.01).timeout

func updateScoreTextLabel(value: float) -> void:
	if ScoreTextLabel == null:
		print("Cannot update ScoreTextLabel: Missing element.")
		return
	ScoreTextLabel.text = str(value)

func updateCurrencyTextLabel(value: float) -> void:
	if CurrencyTextLabel == null:
		print("Cannot update CurrencyTextLabel: Missing element.")
		return
	CurrencyTextLabel.text = str(value)

func updateNightProgressBar(value: float) -> void:
	if NightProgressBar == null:
		print("Cannot update NightProgressBar: Missing element.")
		return
	NightProgressBar.value = SpawnManager.timeLeft() / float(SpawnManager.nightLength) * 100.0

func updateWaveLabel() -> void:
	if WaveLabel == null:
		print("Cannot update WaveLabel: Missing element.")
		return 
	WaveLabel.text = "Wave: " + str(SpawnManager.currentWave)

func updateUpgradesLabels() -> void:
	Heal.text = ""
	HealAmount.text = ""
	MaxHealth.text = ""
	ManaRegen.text = ""
	MaxMana.text = ""
	TowerRange.text = ""
	TowerDamage.text = ""
	TowerAtkSpd.text = ""
