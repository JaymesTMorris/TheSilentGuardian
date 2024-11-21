extends Button



func _on_pressed() -> void:
	print("Return To Menu Pressed!")
	get_tree().change_scene_to_file("res://Scenes/Levels/Main.tscn")
