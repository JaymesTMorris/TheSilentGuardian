extends Node

@export var healthBarValue: float = 1.0
@export var energyBarValue: float = 1.0
@export var currencyLabelValue: float = 0.0
var ManaBar: ProgressBar
var ManaDelayBar: ProgressBar


func updateHealthBar(value: float) -> void:
	healthBarValue = value

func updateManaBar(value: float) -> void:
	# Get the mana/manaDelay bars
	ManaBar = getManaBar()
	ManaDelayBar = getManaDelayBar()
	
	ManaBar.value = value
	while ManaDelayBar.value > ManaBar.value:
		ManaDelayBar.value -= 1
		await get_tree().create_timer(0.01).timeout

func updateCurrencyLabel(value: float) -> void:
	currencyLabelValue = value

func getManaBar() -> ProgressBar:
	return get_node("/root/Main/Player/CanvasLayer/UserInterface/ManaBar")

func getManaDelayBar() -> ProgressBar:
	return get_node("/root/Main/Player/CanvasLayer/UserInterface/ManaBar/DelayBar")
