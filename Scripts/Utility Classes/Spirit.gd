extends Node2D

class_name Spirit

@export var spiritName: String = "Unnamed Spirit"
@export var health: int = 100
@export var speed: float = 10.0
@export var attack: Attack
@onready var sprite: Sprite2D = $sprite2D

func initialize(spirit_name: String, health: int, speed: float, attack: Attack, sprite: Sprite2D) -> void:
	self.spiritName = spirit_name
	self.health = health
	self.speed = speed
	self.attack = attack
	self.sprite = sprite

# Called when the node enters the scene tree for initialization.
func _ready() -> void:
	# Optional initialization code can go here.
	pass

# Method to reduce health when the spirit takes damage
func takeDamage(damage: int) -> void:
	health -= damage
	if health <= 0:
		die()

# Method to handle death of the spirit
func die() -> void:
	queue_free()  # Removes the spirit from the scene.
	# TODO Increase the death counter
	# TODO Earn money
	# TODO Any other death things

# Method to move the spirit
func move(direction: Vector2) -> void:
	position += direction * speed * get_process_delta_time()
