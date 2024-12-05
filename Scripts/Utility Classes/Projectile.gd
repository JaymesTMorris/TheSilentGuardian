#region Setup
extends Node2D

class_name Projectile


var speed: float  # Dynamically calculated to reach the target in allotted second
var target: Spirit
var collisionTimer: Timer = Timer.new()
var sprite: Sprite2D
var hitDistanceThreshold: float = 20.0  # How close the projectile must be to hit target
var distance: float # Distance to target
var targetLastPos: Vector2 # The last posistion of the target
var minSpeed: float = 50.0
#endregion

func _init(target: Spirit) -> void:
	self.target = target

func _ready() -> void:
	z_index = 8
	
	add_child(collisionTimer) # Create timer used for speed calculations
	
	if target == null:
		push_warning("%s (Projectile): Initialized with no target; Deleting" % name)
		queue_free()
	
	if not sprite:
		createProjectileSprite()
	
	targetLastPos = target.global_position
	global_position = get_parent().global_position # Ensure projectile spawns near tower

	startCollisionTimer()

func _process(delta: float) -> void:
	if target and is_instance_valid(target):
		# Update target's last known position
		targetLastPos = target.global_position

	# Calculate the distance to the last known position
	distance = global_position.distance_to(targetLastPos)

	# Check if the projectile is close to the last known position
	if distance <= hitDistanceThreshold:
		hitTargetOrDelete()
		return
	
	updateSpeed()
	moveProjectile(delta)

#region Helper Functions
# Hits the target or deletes itself if no vaild target
func hitTargetOrDelete() -> void:
	if target and is_instance_valid(target):
		target.takeDamage(StatsManager.TowerDamage)
		queue_free()
	else:
		queue_free()

func startCollisionTimer() -> void:
	# Start the timer that tracks time until projectile timeout
	collisionTimer.start()
	collisionTimer.wait_time = 1.0
	collisionTimer.one_shot = true
	collisionTimer.connect("timeout", Callable(self, "hitTargetOrDelete"))

func createProjectileSprite() -> void:
	sprite = Sprite2D.new()
	sprite.texture = preload("res://Sprites/Tower/necrobolt1_strip.png")
	sprite.centered = true
	sprite.position = Vector2.ZERO
	add_child(sprite)

func moveProjectile(delta: float) -> void:
	var direction: Vector2 = (targetLastPos - global_position).normalized()
	position += direction * speed * delta

func updateSpeed() -> void:
	if collisionTimer.time_left > 0:
		speed = distance / collisionTimer.time_left
		speed = max(speed, minSpeed) # Ensure speed is at least the minimum speed
#endregion
