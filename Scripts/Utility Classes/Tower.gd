extends Node2D

var target: Spirit 
var shootTimer: Timer = Timer.new()  # Timer to control shooting interval

func _ready() -> void:
	# Set the z_index for the tower
	z_index = 5
	shootTimerTick()

func spawnProjectile() -> void:
	updateTarget()
	if target == null: # Don't shoot if there is no target
		return
	if position.distance_to(target.position) > StatsManager.TowerRange:
		return
	var projectile: Projectile = Projectile.new(target)
	add_child(projectile)
	projectile.global_position = global_position  # Start at the tower's position

func shootTimerTick() -> void:
	# Add and start the shooting timer to spawn a projectile every second
	add_child(shootTimer)
	shootTimer.wait_time = StatsManager.TowerAtkSpd  # Shoot every 0.25 seconds
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
	
func updateTarget() -> void:
	target = getClosestSpirit()
