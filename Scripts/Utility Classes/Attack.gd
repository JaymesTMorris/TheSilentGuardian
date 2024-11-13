extends Resource

class_name Attack

@export var name: String = "Unnamed Attack"
@export var damage: int = 10
@export var knockback: float = 5.0
@export var stunDuration: float = 1.0
@export var range: float = 50.0
var projectile: Projectile = null

func initialize(name: String, damage: int, knockback: float, stun_duration: float, range: float, projectile: Projectile) -> void:
	self.name = name
	self.damage = damage
	self.knockback = knockback
	self.stunDuration = stun_duration
	self.range = range
	self.projectile = projectile
