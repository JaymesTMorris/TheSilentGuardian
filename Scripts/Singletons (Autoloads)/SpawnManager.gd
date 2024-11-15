extends Node

@export var spawnRate: float = 1.0
@export var maxSpirits: int = 10
@onready var highlightLayer: TileMapLayer = get_node("/root/Main/Map/HighlightLayer")

@onready var bunnyScene: PackedScene = load("res://Scenes/BunnySpirit.tscn")
func spawnSpirit() -> void:
	# Implement spirit spawning logic
	var instance: Node = bunnyScene.instantiate()
	var cellLocation: Vector2i = highlightLayer.highlighted_cell
	instance.position = Vector2(cellLocation.x * cell_size.x, cellLocation.y * cell_size.y)
	instance.z_index = 8  # Set the z_index to so it spawns above the ground
	add_child(instance)

var cell_size: Vector2 = Vector2(16, 16)  # Set cell size based on your grid
@onready var packedScene: PackedScene = load("res://Scenes/Tower.tscn")

func spawnTower() -> void:
	var instance: Node = packedScene.instantiate()
	var cellLocation: Vector2i = highlightLayer.highlighted_cell
	instance.position = Vector2(cellLocation.x * cell_size.x, cellLocation.y * cell_size.y)
	instance.z_index = 8  # Set the z_index to so it spawns above the ground
	add_child(instance)
