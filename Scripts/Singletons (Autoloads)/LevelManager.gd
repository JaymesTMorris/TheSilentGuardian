extends Node

@export var spiritHealthMultiplier: float = 1.0
@export var spiritDamageMultiplier: float = 1.0
@export var nightDuration: float = 60.0

func startNight() -> void:
	# Implement night start logic
	pass

func endNight() -> void:
	# Implement night end logic
	pass

func setSpiritHealthMultiplier(multiplier: float) -> void:
	spiritHealthMultiplier = multiplier

func setSpiritDamageMultiplier(multiplier: float) -> void:
	spiritDamageMultiplier = multiplier
