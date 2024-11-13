extends Node

@export var healthBarValue: float = 1.0
@export var energyBarValue: float = 1.0
@export var currencyLabelValue: float = 0.0

func updateHealthBar(value: float) -> void:
	healthBarValue = value

func updateEnergyBar(value: float) -> void:
	energyBarValue = value

func updateCurrencyLabel(value: float) -> void:
	currencyLabelValue = value
