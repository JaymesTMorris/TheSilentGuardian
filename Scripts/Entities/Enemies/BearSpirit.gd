extends Spirit

# Custom properties for BearSpirit
@export var moveDirection: Vector2 = Vector2.RIGHT  # Direction to move (right)

func _ready() -> void:
	# Initialize BearSpirit-specific properties
	initialize("BearSpirit", 200*LevelManager.spiritHealthMultiplier, 50.0, createBearAttack(), sprite)

func _process(delta: float) -> void:
	# Continuously move in the specified direction
	move(moveDirection)
	
	# Check if the bear reaches the village barrier
	if global_position.x >= getVillageBarrierXPos():
		HealthManager.takeDamage(attack.damage)
		queue_free()

func createBearAttack() -> Attack:
	# Create an instance of BearSpirit's attack
	var attack: Attack = Attack.new()
	attack.initialize("BearAttack", 200*LevelManager.spiritDamageMultiplier, 0, 0, 0, null)
	return attack

func getVillageBarrierXPos() -> float:
	# Retrieve the position of the village barrier
	var barrier: TileMapLayer = get_node("/root/Main/Map/VillageBarrier")
	if barrier == null:
		push_warning(self.name.to_upper()+": NO VILLAGE BARRIER FOUND")
		return 0
	return barrier.global_position.x
