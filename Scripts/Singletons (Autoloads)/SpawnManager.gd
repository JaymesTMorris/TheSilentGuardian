extends Node

@export var spawnRate: float = 1.0
@export var maxSpirits: int = 10

func spawnSpirit(location: Vector2) -> void:
	# Implement spirit spawning logic
	pass

var cell_size: Vector2 = Vector2(16, 16)  # Set cell size based on your grid
@onready var packedScene: PackedScene = load("res://Scenes/Tower.tscn")
@onready var highlightLayer: TileMapLayer = get_node("/root/Main/Map/HighlightLayer")
func spawnTower() -> void:
	var instance: Node = packedScene.instantiate()
	var cellLocation: Vector2i = highlightLayer.highlighted_cell
	instance.position = Vector2(cellLocation.x * cell_size.x, cellLocation.y * cell_size.y)
	instance.z_index = 8  # Set the z_index to so it spawns above the ground
	add_child(instance)
