extends Node

@export var maxEnergy: int = 100
@export var currentEnergy: int = 100
@export var rechargeRate: float = 1.0
@export var energyUsed: int = 0
@export var energyCollected: int = 0

func useEnergy(amount: int) -> bool:
	if currentEnergy >= amount:
		currentEnergy -= amount
		incrementEnergyUsed(amount)
		return true
	return false

func replenishEnergy(amount: int) -> void:
	currentEnergy = min(currentEnergy + amount, maxEnergy)

func incrementEnergyUsed(amount: int) -> void:
	energyUsed += amount

func incrementEnergyCollected(amount: int) -> void:
	energyCollected += amount
