extends Node

@export var maxHealth: int = 1000
@export var currentHealth: int = 1000
@export var damageTaken: int = 0 # Damage taken over the course of the whole game
@export var healingDone: int = 0 # healing done over the course of the whole game

func takeDamage(amount: int) -> void:
	if amount >= currentHealth: # Village is going to die with this hit
		incrementDamageTaken(currentHealth)
		currentHealth = 0
		UIManager.updateHealthBar(currentHealth)
		
		# Game Over
		SpawnManager.stopNight()
		get_tree().change_scene_to_file("res://Scenes/UI/GameOver.tscn")
	else:
		incrementDamageTaken(amount)
		currentHealth -= amount
		UIManager.updateHealthBar(currentHealth)
		
func heal(percentage: int) -> void: # heals percentage of max health
	var healAmount: int = int((percentage / 100.0) * maxHealth)
	if currentHealth + healAmount >= maxHealth:
		currentHealth = maxHealth
		UIManager.updateHealthBar(currentHealth)
	else:
		currentHealth += healAmount
		UIManager.updateHealthBar(currentHealth)


func incrementDamageTaken(amount: int) -> void:
	damageTaken += amount

func incrementHealingDone(amount: int) -> void:
	healingDone += amount
