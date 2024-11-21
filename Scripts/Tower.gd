extends Node2D

# TODO Target the closest enemy
@onready var target: Spirit #= get_node("/root/Main/BunnySpirit")
var shootTimer: Timer = Timer.new()  # Timer to control shooting interval

func _ready() -> void:
	shootTimerTick()

func spawnProjectile() -> void:
	# Instantiate and set up a new projectile
	var projectile: Projectile = Projectile.new()
	add_child(projectile)
	projectile.global_position = global_position  # Start at the tower's position
	projectile.target = getClosestSpirit()  # Set the projectile's target

func shootTimerTick() -> void:
	# Add and start the shooting timer to spawn a projectile every second
	add_child(shootTimer)
	shootTimer.wait_time = 1.0  # Shoot every 1 second
	shootTimer.one_shot = false
	shootTimer.connect("timeout", Callable(self, "spawnProjectile"))
	shootTimer.start()

func getClosestSpirit() -> Node2D:
	var spawnManager: Node = get_node("/root/SpawnManager")
	if spawnManager == null:
		return null
	
	var closestSpirit: Node2D = null
	var closestDistance: float = INF
	
	for child in spawnManager.get_children():
		if child is Spirit:
			var distance: float = position.distance_to(child.position)
			if distance < closestDistance:
				closestDistance = distance
				closestSpirit = child
	
	return closestSpirit
