extends Node

# Export variables for flexibility
@export var nightLength: int = 8 # seconds
@export var baseSpawnInterval: float = 1
@export var minSpawnInterval: float = 0.1
@export var spawnXPosition: int = -320
@export var minYPosition: float = 25
@export var maxYPosition: float = 625

# PackedScene references for the enemy types
@onready var bunnyScene: PackedScene = load("res://Scenes/Entities/Dynamic/BunnySpirit.tscn")
@onready var bearScene: PackedScene = load("res://Scenes/Entities/Dynamic/BearSpirit.tscn")
@onready var batScene: PackedScene = load("res://Scenes/Entities/Dynamic/BatSpirit.tscn")

# Variables for internal state
var nightTimer: float = 0.0
var spawnTimer: float = 0.0
var isNightActive: bool = false
var currentWave: int = 1

# Function to start the night cycle
func startNight() -> void:
	if isNightActive == false:
		print("Night started!")
		nightTimer = float(nightLength)
		spawnTimer = randomizeSpawnInterval()
		isNightActive = true
		set_process(true)

# Function to randomize the spawn interval
func randomizeSpawnInterval() -> float:
	return clamp(baseSpawnInterval + randf_range(-0.5, 0.5), minSpawnInterval, baseSpawnInterval + 0.5)

# Called every frame
func _process(delta: float) -> void:
	if isNightActive:
		UIManager.updateNightProgressBar(timeLeft())
		if nightTimer > 0:
			nightTimer -= delta
			spawnTimer -= delta

			# Spawn an enemy when the spawn timer reaches 0
			if spawnTimer <= 0:
				spawnEnemy()
				spawnTimer = randomizeSpawnInterval()
		else:
			# Night ends
			endNight()
			# Start New Night
			currentWave += 1
			UIManager.updateWaveLabel()
			if currentWave == 40:
				baseSpawnInterval = 0.9
			elif currentWave == 50:
				baseSpawnInterval = 0.8
			elif currentWave == 60:
				baseSpawnInterval = 0.7
			elif currentWave == 70:
				baseSpawnInterval = 0.6
			elif currentWave == 80:
				baseSpawnInterval = 0.4
			elif currentWave == 90:
				baseSpawnInterval = 0.2
			startNight()

# Function to spawn an enemy
func spawnEnemy() -> void:
	# Randomly select enemy type (70% Enemy 1, 30% Enemy 2)
	var enemyScene: PackedScene 
	var rndNum: float = randf()
	if currentWave < 10:
		enemyScene = bunnyScene
	elif currentWave < 20:
		enemyScene = bunnyScene if rndNum <= 0.7 else bearScene
	else:
		if rndNum < 0.3:
			enemyScene = bunnyScene
		elif rndNum < 0.7:
			enemyScene = bearScene
		else:
			enemyScene = batScene
	# Instance the enemy and set its position
	var enemy: Node2D = enemyScene.instantiate() as Node2D
	enemy.global_position = Vector2(spawnXPosition, randf_range(minYPosition, maxYPosition))
	enemy.z_index = 8 # Ensure the enemy appears above the map
	
	add_child(enemy)
	
	# Debug message
	#print("Spawned Enemy: ", enemyScene.resource_path, " at Y: ", enemy.global_position.y)

# Function to end the night
func endNight() -> void:
	print("Night ended!")
	isNightActive = false
	set_process(false)

# Function to return the time left in the night
func timeLeft() -> float:
	return max(nightTimer, 0.0)

var cell_size: Vector2 = Vector2(16, 16)  # Set cell size based on your grid
@onready var packedScene: PackedScene = load("res://Scenes/Entities/Static/Tower.tscn")

func spawnTower() -> void:
	var instance: Node = packedScene.instantiate()
	var cellLocation: Vector2i = highlightLayer().highlighted_cell
	instance.position = Vector2(cellLocation.x * cell_size.x, cellLocation.y * cell_size.y)
	instance.z_index = 8  # Set the z_index to so it spawns above the ground
	add_child(instance)
	StatsManager.TowersPlaced += 1

func highlightLayer() -> TileMapLayer:
	return get_node("/root/Main/Map/HighlightLayer")
	
func deleteAllSpirits() -> void:
	for child in get_children():
		child.queue_free()
		
# Function to stop the night immediately
func stopNight() -> void:
	if isNightActive:
		print("Night Stopped!")
		isNightActive = false
		nightTimer = 0.0  # Reset the night timer
		spawnTimer = 0.0  # Reset the spawn timer
		set_process(false)  # Stop the _process function from running
		deleteAllSpirits()  # Clear all active spirits
