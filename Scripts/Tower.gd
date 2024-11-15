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
	projectile.target = getClosestChild(global_position)  # Set the projectile's target

func shootTimerTick() -> void:
	# Add and start the shooting timer to spawn a projectile every second
	add_child(shootTimer)
	shootTimer.wait_time = 1.0  # Shoot every 1 second
	shootTimer.one_shot = false
	shootTimer.connect("timeout", Callable(self, "spawnProjectile"))
	shootTimer.start()

# Function to find the closest child of SpawnManager to the given position
func getClosestChild(targetGlobalPosition: Vector2) -> Node:
	var closestNode: Node = null
	var shortestDistance: float = INF

	# Ensure the singleton exists and has children
	if SpawnManager and SpawnManager.get_child_count() > 0:
		for child in SpawnManager.get_children():
			if child is Node2D:
				var childGlobalPosition: Vector2 = child.global_position
				var distance: float = targetGlobalPosition.distance_to(childGlobalPosition)
				
				if distance < shortestDistance:
					shortestDistance = distance
					closestNode = child

	return closestNode
