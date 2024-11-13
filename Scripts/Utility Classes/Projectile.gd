extends Node2D

class_name Projectile

@export var projectileName: String = "Unnamed Projectile"
@export var damage: int = 10
@export var speed: float = 10.0
@export var trajectory: Vector2 = Vector2.ZERO
@export var range: float = 100.0
@onready var sprite: Sprite2D = $sprite2D

func initialize(name: String, damage: int, speed: float, trajectory: Vector2, range: float, sprite: Sprite2D) -> void:
	self.name = name
	self.damage = damage
	self.speed = speed
	self.trajectory = trajectory
	self.range = range
	self.sprite = sprite
