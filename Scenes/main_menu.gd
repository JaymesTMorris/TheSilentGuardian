extends Control

func _on_start_pressed() -> void:
	print("Start Button Pressed!")
	get_tree().change_scene_to_file("res://Scenes/Levels/Level1.tscn")

func _on_quit_pressed() -> void:
	print("Quit Button Pressed!")
	get_tree().quit()

func _on_credits_pressed() -> void:
	print("Credits Button Pressed!")
	get_tree().change_scene_to_file("res://Scenes/Levels/Credit.tscn")
