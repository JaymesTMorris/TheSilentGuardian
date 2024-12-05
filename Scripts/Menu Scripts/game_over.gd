extends Control

func _ready() -> void:
	AudioManager.playMusic("res://Music&Sounds/Music/264053__b_lamerichs__short-loops-13-02-2015-4-game-over-1.mp3")
	showStats()

func showStats() -> void:
	var StatsLabel: Label = getStatsLabel()
	StatsLabel.text  = "Wave:" + str(SpawnManager.currentWave)
	StatsLabel.text += "\nScore:" + str(ScoreManager.currentScore)
	StatsLabel.text += "\nSpirits Repeled:" + str(GameStateManager.spiritsKilled)
	#StatsLabel.text += "\nTime Survived:" + str(GameStateManager.timeSurvived)
	
func getStatsLabel() -> Label:
	return get_node("/root/GameOver/StatsBox")
	
func _on_quit_pressed() -> void:
	var sound_path = "res://Music&Sounds/Sounds/506052__mellau__button-click-3.wav"
	AudioManager.playSound(sound_path)
	
	# Get the AudioStreamPlayer responsible for playing the sound
	var sound_player = AudioManager.soundPlayer
	if sound_player and sound_player.stream == load(sound_path):
		# Wait for the sound to finish playing
		await get_tree().create_timer(0.25).timeout

	# Quit the game after the sound has finished
	get_tree().quit()
