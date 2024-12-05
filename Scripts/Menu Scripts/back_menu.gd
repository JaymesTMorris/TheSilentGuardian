extends Button

func _ready() -> void:
	AudioManager.playMusic("res://Music&Sounds/Music/736623__gustavo_alivera__creepy-background-music.mp3")

func _on_pressed() -> void:
	AudioManager.playSound("res://Music&Sounds/Sounds/506052__mellau__button-click-3.wav")
	print("Return To Menu Pressed!")
	get_tree().change_scene_to_file("res://Scenes/UI/Main.tscn")
