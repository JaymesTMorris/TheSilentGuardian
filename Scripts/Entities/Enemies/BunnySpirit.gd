extends Spirit

@export var move_direction: Vector2 = Vector2.RIGHT  # Direction to move (right)

func _ready() -> void:
	attack = Attack.new()  # Create an instance of Attack
	attack.initialize("BunnyAttack", 50, 0, 0, 0, null)


func _process(delta: float) -> void:
	move(move_direction) # Continuously move to the right
	if global_position.x >= getVillageBarrierXPos():
		HealthManager.takeDamage(attack.damage)
		queue_free()
	
func getVillageBarrierXPos() -> float:
	var barrier: TileMapLayer = get_node("/root/Main/Map/VillageBarrier")
	return barrier.global_position.x
