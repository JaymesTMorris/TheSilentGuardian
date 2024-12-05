extends Node2D

var target: Spirit
var shootTimer: Timer = Timer.new()  # Timer to control shooting interval

func _ready() -> void:
	# Add and configure the shooting timer
	add_child(shootTimer)
	shootTimer.one_shot = false
	shootTimer.connect("timeout", Callable(self, "spawnProjectile"))
	updateShootTimer()  # Set initial shooting interval
	shootTimer.start()
	StatsManager.connect("attack_speed_updated", Callable(self, "_on_attack_speed_updated"))

func spawnProjectile() -> void:
	updateTarget()
	if target == null: # Don't shoot if there is no target
		return
	if position.distance_to(target.position) > StatsManager.TowerRange:
		return
	var projectile: Projectile = Projectile.new(target)
	add_child(projectile)
	projectile.global_position = global_position  # Start at the tower's position

func updateShootTimer() -> void:
	# Update the timer's interval to match the current attack speed
	if shootTimer != null:
		shootTimer.wait_time = StatsManager.TowerAtkSpd

func updateTarget() -> void:
	target = getClosestSpirit()

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

func _on_attack_speed_updated() -> void:
	updateShootTimer()
