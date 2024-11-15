extends Node2D

class_name Projectile

@export var projectileName: String = "Unnamed Projectile"
@export var damage: int = 10
var speed: float  # Dynamically calculated to reach the target in 1 second
@export var range: float = 100.0
var target: Spirit
var collisionTimer: Timer = Timer.new()
var sprite: Sprite2D
var hitDistanceThreshold: float = 20.0  # Distance threshold to "hit" the target

func initialize(name: String, damage: int, range: float, sprite: Sprite2D, target: Spirit) -> void:
	# Initialize projectile properties
	self.projectileName = name
	self.damage = damage
	self.range = range
	self.sprite = sprite
	self.target = target
	add_child(sprite)

func _ready() -> void:
	# Add timer to projectile and set up visual element if not provided
	add_child(collisionTimer)
	if not sprite:
		sprite = Sprite2D.new()
		sprite.texture = preload("res://Sprites/Tower/blue.png")  # Replace with your texture path
		sprite.centered = true
		sprite.position = Vector2.ZERO
		add_child(sprite)
	
	# Set projectile's initial position to match the parent's global position
	global_position = get_parent().global_position

	# Start the timer and calculate speed to reach the target in exactly 1 second
	startCollisionTimer()

	# Connect the timer to delete the projectile if it doesn't reach the target in time
	collisionTimer.wait_time = 1.0
	collisionTimer.one_shot = true
	collisionTimer.connect("timeout", Callable(self, "_onCollisionTimeout"))

func startCollisionTimer() -> void:
	# Start the timer that tracks time until projectile timeout
	collisionTimer.start()

func _process(delta: float) -> void:
	if target:
		# Calculate the distance to the target's global position
		var distance: float = global_position.distance_to(target.global_position)
		
		# Check if the projectile is close enough to the target to "hit" it
		if distance <= hitDistanceThreshold:
			hitTarget()  # Delete the projectile upon hitting the target
			return

		# Adjust speed based on remaining time to ensure projectile reaches target in 1 second
		if collisionTimer.time_left > 0:
			speed = distance / collisionTimer.time_left
		else:
			queue_free()  # Delete projectile if it times out before reaching the target
		
		# Move projectile towards the target
		var direction: Vector2 = (target.global_position - global_position).normalized()
		position += direction * speed * delta

func _onCollisionTimeout() -> void:
	# The projectile timeed out without hitting the target
	# ...should have got close enough to look like it though
	hitTarget()
	
	
func hitTarget() -> void:
	# TODO Damage Target
	queue_free()
