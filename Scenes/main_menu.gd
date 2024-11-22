extends Control

func _onStartPressed() -> void:
	AudioManager.playSound("res://Music&Sounds/Sounds/506052__mellau__button-click-3.wav")
	get_tree().change_scene_to_file("res://Scenes/Levels/Level1.tscn")  # Level 1

func _onQuitPressed() -> void:
	# Quit Game (no sound played on button pressed)
	get_tree().quit()

func _onCreditsPressed() -> void:
	AudioManager.playSound("res://Music&Sounds/Sounds/506052__mellau__button-click-3.wav")
	get_tree().change_scene_to_file("res://Scenes/Levels/Credit.tscn")  # Credits Scene

func _onPlaygroundPressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Levels/PlayGround.tscn")  # Playground Scene
