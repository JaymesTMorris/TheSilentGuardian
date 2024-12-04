extends Spirit

# Custom properties for BunnySpirit
@export var moveDirection: Vector2 = Vector2.RIGHT  # Direction to move (right)

func _ready() -> void:
	# Initialize BunnySpirit-specific properties
	initialize("BunnySpirit", 100*LevelManager.spiritHealthMultiplier, 100.0, createBunnyAttack(), sprite)

func _process(delta: float) -> void:
	# Continuously move in the specified direction
	move(moveDirection)
	
	# Check if the bunny reaches the village barrier
	if global_position.x >= getVillageBarrierXPos():
		HealthManager.takeDamage(attack.damage)
		queue_free()

func createBunnyAttack() -> Attack:
	# Create an instance of BunnySpirit's attack
	var attack: Attack = Attack.new()
	attack.initialize("BunnyAttack", 50*LevelManager.spiritDamageMultiplier, 0, 0, 0, null) #deafult 50 damage
	return attack

func getVillageBarrierXPos() -> float:
	# Retrieve the position of the village barrier
	var barrier: TileMapLayer = get_node("/root/Main/Map/VillageBarrier")
	if barrier == null:
		push_warning(self.name.to_upper()+": NO VILLAGE BARRIER FOUND")
		return 0
	return barrier.global_position.x
