extends Node

@export var volume: float = 1.0
@export var isMuted: bool = false

func playSound(effectName: String) -> void:
	# Implement sound playback
	pass

func stopMusic() -> void:
	# Implement music stopping logic
	pass

func setVolume(level: float) -> void:
	volume = level
