extends Control

func _onStartPressed() -> void:
	AudioManager.playSound("res://Music&Sounds/Sounds/506052__mellau__button-click-3.wav")
	get_tree().change_scene_to_file("res://Scenes/Levels/Tutorial.tscn")  # Tutorial
	
func _onContinuePressed() -> void:
	AudioManager.playSound("res://Music&Sounds/Sounds/506052__mellau__button-click-3.wav")
	get_tree().change_scene_to_file("res://Scenes/Levels/Level1.tscn")  # Tutorial

func _onQuitPressed() -> void:
	# Quit Game (no sound played on button pressed)
	get_tree().quit()

func _onCreditsPressed() -> void:
	AudioManager.playSound("res://Music&Sounds/Sounds/506052__mellau__button-click-3.wav")
	get_tree().change_scene_to_file("res://Scenes/Levels/Credit.tscn")  # Credits Scene
	
##################################
#        GAME OVER SCREEN        #
##################################
func _ready():
	# If the GameOver scene just loaded
	if self.name == "GameOver":
		showStats()

func showStats() -> void:
	var StatsLabel: Label = getStatsLabel()
	StatsLabel.text  = "Wave:" + str(SpawnManager.currentWave)
	StatsLabel.text += "\nScore:" + str(ScoreManager.currentScore)
	StatsLabel.text += "\nSpirits Repeled:" + str(GameStateManager.spiritsKilled)
	#StatsLabel.text += "\nTime Survived:" + str(GameStateManager.timeSurvived)
	
func getStatsLabel() -> Label:
	return get_node("/root/GameOver/StatsBox")
