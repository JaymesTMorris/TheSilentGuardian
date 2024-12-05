extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	UIManager.initializeUIElements()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):  # "ui_cancel" is the default Esc action in Godot
		get_tree().quit()
