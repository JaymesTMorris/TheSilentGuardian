extends Node

@export var maxEnergy: float = 100
@export var currentEnergy: float = 100
@export var rechargeRate: float = 0.1
@export var energyUsed: float = 0
@export var energyCollected: float = 0

# Called when the node enters the scene tree
func _ready() -> void:
	# Set up a timer for energy replenishment
	var energyTimer: Timer = Timer.new()
	energyTimer.wait_time = 0.1  # Replenish every 0.1 seconds
	energyTimer.autostart = true  # Start automatically
	energyTimer.one_shot = false  # Repeat the timer
	energyTimer.connect("timeout", Callable(self, "_on_energy_timer_timeout"))
	add_child(energyTimer)

func useEnergy(amount: int) -> bool:
	if currentEnergy >= amount:
		currentEnergy -= amount
		incrementEnergyUsed(amount)
		UIManager.updateManaBar(currentEnergy)
		return true
	return false

func replenishEnergy(amount: float) -> void:
	currentEnergy = minf(currentEnergy + amount, maxEnergy)
	UIManager.updateManaBar(currentEnergy)  # Update the mana bar

func incrementEnergyUsed(amount: int) -> void:
	energyUsed += amount

func incrementEnergyCollected(amount: int) -> void:
	energyCollected += amount

# Called when the timer times out
func _on_energy_timer_timeout() -> void:
	replenishEnergy(rechargeRate)
