extends Node

#@export var healthBarValue: float = 1.0
#@export var energyBarValue: float = 1.0
#@export var currencyLabelValue: float = 0.0
var HealthBar: ProgressBar
var HealthDelayBar: ProgressBar
var ManaBar: ProgressBar
var ManaDelayBar: ProgressBar


func updateHealthBar(value: float) -> void:
	# Get the mana/manaDelay bars
	HealthBar = getHealthBar()
	HealthDelayBar = getHealthDelayBar()
	
	HealthDelayBar.value = HealthBar.value
	HealthBar.value = value
	while HealthDelayBar.value > HealthBar.value:
		HealthDelayBar.value -= 1
		await get_tree().create_timer(0.01).timeout

func updateManaBar(value: float) -> void:
	# Get the mana/manaDelay bars
	ManaBar = getManaBar()
	ManaDelayBar = getManaDelayBar()
	
	ManaDelayBar.value = ManaBar.value
	ManaBar.value = value
	while ManaDelayBar.value > ManaBar.value:
		ManaDelayBar.value -= 1
		await get_tree().create_timer(0.01).timeout

#func updateCurrencyLabel(value: float) -> void:
#	currencyLabelValue = value
func getHealthBar() -> ProgressBar:
	return get_node("/root/Main/Player/CanvasLayer/UserInterface/HealthBar")

func getHealthDelayBar() -> ProgressBar:
	return get_node("/root/Main/Player/CanvasLayer/UserInterface/HealthBar/DelayBar")

func getManaBar() -> ProgressBar:
	return get_node("/root/Main/Player/CanvasLayer/UserInterface/ManaBar")

func getManaDelayBar() -> ProgressBar:
	return get_node("/root/Main/Player/CanvasLayer/UserInterface/ManaBar/DelayBar")
