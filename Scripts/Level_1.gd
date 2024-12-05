extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	AudioManager.playMusic("res://Music&Sounds/Music/766943__josefpres__piano-loops-149-efect-3-octave-long-loop-120-bpm.wav")
	UIManager.initializeUIElements()
	UIManager.updateUpgradesLabels()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):  # "ui_cancel" is the default Esc action in Godot
		get_tree().quit()
