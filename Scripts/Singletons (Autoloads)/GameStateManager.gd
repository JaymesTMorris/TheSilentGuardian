extends Node

@export var currentNight: int = 1
@export var isGameOver: bool = false
@export var totalScore: int = 0
@export var spiritsKilled: int = 0
@export var timeSurvived: float = 0.0

func startGame() -> void:
	currentNight = 1
	isGameOver = false
	totalScore = 0
	spiritsKilled = 0
	timeSurvived = 0.0

func endGame() -> void:
	isGameOver = true

func incrementNight() -> void:
	currentNight += 1

func incrementSpiritsKilled(amount: int) -> void:
	spiritsKilled += amount

func incrementTimeSurvived(amount: float) -> void:
	timeSurvived += amount
