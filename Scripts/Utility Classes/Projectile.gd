#region Setup
extends Node2D

class_name Projectile

@export var damage: int = 10
var speed: float  # Dynamically calculated to reach the target in allotted second
var target: Spirit
var collisionTimer: Timer = Timer.new()
var sprite: Sprite2D
var hitDistanceThreshold: float = 20.0  # How close the projectile must be to hit target
var distance: float # Distance to target
# TODO Add minimum speed
#endregion

func _ready() -> void:
	add_child(collisionTimer) # Create timer used for speed calculations
	
	if not sprite:
		createProjectileSprite()
	
	global_position = get_parent().global_position # Ensure projectile spawns near tower

	startCollisionTimer()

func _process(delta: float) -> void:
	if target:
		# Calculate the distance to the target's global position
		distance = global_position.distance_to(target.global_position)
		
		# Check if the projectile is close/on top of the target
		if distance <= hitDistanceThreshold:
			hitTarget()
			return # Ensures the rest of the _process function does not run
		
		updateSpeed()
		moveProjectile(delta)
	
#region Helper Functions
func hitTarget() -> void:
	# TODO Damage Target
	queue_free()

func startCollisionTimer() -> void:
	# Start the timer that tracks time until projectile timeout
	collisionTimer.start()
	collisionTimer.wait_time = 1.0
	collisionTimer.one_shot = true

func createProjectileSprite() -> void:
	sprite = Sprite2D.new()
	sprite.texture = preload("res://Sprites/Tower/blue.png")  # Replace with your texture path
	sprite.centered = true
	sprite.position = Vector2.ZERO
	add_child(sprite)

func moveProjectile(delta: float) -> void:
	var direction: Vector2 = (target.global_position - global_position).normalized()
	position += direction * speed * delta

func updateSpeed() -> void:
	if collisionTimer.time_left > 0:
		speed = distance / collisionTimer.time_left
#endregion
