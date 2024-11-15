extends Node2D

@onready var target: Spirit = get_node("/root/Main/BunnySpirit")  # Target for the projectiles
var shootTimer: Timer = Timer.new()  # Timer to control shooting interval

func _ready() -> void:
	# Add and start the shooting timer to spawn a projectile every second
	add_child(shootTimer)
	shootTimer.wait_time = 1.0  # Shoot every 1 second
	shootTimer.one_shot = false
	shootTimer.connect("timeout", Callable(self, "spawnProjectile"))
	shootTimer.start()

func spawnProjectile() -> void:
	# Instantiate and set up a new projectile
	var projectile: Projectile = Projectile.new()
	add_child(projectile)
	projectile.global_position = global_position  # Start at the tower's position
	projectile.target = target  # Set the projectile's target
