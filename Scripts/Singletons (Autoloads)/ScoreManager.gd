extends Node

@export var currentScore: int = 0
@export var highScore: int = 0

func addScore(points: int) -> void:
	currentScore += points
	updateHighScore()

func resetScore() -> void:
	currentScore = 0

func updateHighScore() -> void:
	if currentScore > highScore:
		highScore = currentScore
