extends Control

func _ready() -> void:
	AudioManager.playMusic("res://Music&Sounds/Music/736623__gustavo_alivera__creepy-background-music.mp3")

func _onStartPressed() -> void:
	AudioManager.playSound("res://Music&Sounds/Sounds/506052__mellau__button-click-3.wav")
	get_tree().change_scene_to_file("res://Scenes/UI/Tutorial.tscn")  # Tutorial

func _onContinuePressed() -> void:
	AudioManager.playSound("res://Music&Sounds/Sounds/506052__mellau__button-click-3.wav")
	get_tree().change_scene_to_file("res://Scenes/Levels/Level1.tscn")  # Level 1

func _onQuitPressed() -> void:
	var sound_path = "res://Music&Sounds/Sounds/506052__mellau__button-click-3.wav"
	AudioManager.playSound(sound_path)
	
	# Get the AudioStreamPlayer responsible for playing the sound
	var sound_player = AudioManager.soundPlayer
	if sound_player and sound_player.stream == load(sound_path):
		# Wait for the sound to finish playing
		await get_tree().create_timer(0.25).timeout

	# Quit the game after the sound has finished
	get_tree().quit()

func _onCreditsPressed() -> void:
	AudioManager.playSound("res://Music&Sounds/Sounds/506052__mellau__button-click-3.wav")
	get_tree().change_scene_to_file("res://Scenes/UI/Credit.tscn")  # Credits Scene
