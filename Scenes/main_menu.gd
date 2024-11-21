extends Control

# Function to play the music
func play_music(music_path: String) -> void:
	var music_player: AudioStreamPlayer2D = $AudioStreamPlayer2D  # Get the audio player node
	var new_music: AudioStream = load(music_path)  # Load the sound file dynamically
	
	if new_music == null:
		print("Failed to preload music at path: " + music_path)
		return
		
	music_player.stream = new_music  # Set the stream to the loaded music
	music_player.play()  # Play the sound

# Start button pressed
func _on_start_pressed() -> void:
	print("Start Button Pressed!")
	play_music("res://Music&Sounds/Sounds/506052__mellau__button-click-3.wav")
	get_tree().change_scene_to_file("res://Scenes/Levels/Level1.tscn")  # Change to Level 1 scene

# Quit button pressed
func _on_quit_pressed() -> void:
	print("Quit Button Pressed!")
	play_music("res://Music&Sounds/Sounds/506052__mellau__button-click-3.wav")
	get_tree().quit()  # Quit the game

# Credits button pressed
func _on_credits_pressed() -> void:
	print("Credits Button Pressed!")
	#play_music("res://Music&Sounds/Sounds/506052__mellau__button-click-3.wav")
	AudioManager.playSound("res://Music&Sounds/Sounds/506052__mellau__button-click-3.wav")
	get_tree().change_scene_to_file("res://Scenes/Levels/Credit.tscn")  # Change to Credits scene

# Play round button pressed
func _on_play_ground_pressed() -> void:
	print("Play Ground Button Pressed!")
	get_tree().change_scene_to_file("res://Scenes/Levels/PlayGround.tscn")  # Change to Credits scene
