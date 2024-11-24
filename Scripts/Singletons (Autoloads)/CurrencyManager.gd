extends Node

@export var maxCurrency: int = 1000
@export var currentCurrency: int = 0
@export var totalCurrencyEarned: int = 0

func spendCurrency(amount: int) -> bool:
	if currentCurrency >= amount:
		currentCurrency -= amount
		UIManager.updateCurrencyTextLabel(currentCurrency)
		return true
	return false

func earnCurrency(amount: int) -> void:
	currentCurrency = min(currentCurrency + amount, maxCurrency)
	UIManager.updateCurrencyTextLabel(currentCurrency)
	incrementTotalCurrencyEarned(amount)

func incrementTotalCurrencyEarned(amount: int) -> void:
	totalCurrencyEarned += amount
