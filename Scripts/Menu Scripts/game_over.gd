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
	


func _on_quit_pressed():
	AudioManager.playSound("res://Music&Sounds/Sounds/506052__mellau__button-click-3.wav")
	get_tree().quit()
