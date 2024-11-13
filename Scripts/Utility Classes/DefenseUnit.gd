extends Node2D

class_name DefenseUnit

@export var unitName: String = "Unnamed Defense Unit"
@export var attack: Attack
@export var range: float = 50.0
@export var duration: float = 10.0
@export var rechargeRate: float = 1.0
@export var unitPosition: Vector2 = Vector2.ZERO
@onready var sprite: Sprite2D = $sprite2D

func initialize(name: String, attack: Attack, range: float, duration: float, recharge_rate: float, position: Vector2, sprite: Sprite2D) -> void:
	self.name = name
	self.attack = attack
	self.range = range
	self.duration = duration
	self.rechargeRate = recharge_rate
	self.position = position
	self.sprite = sprite
