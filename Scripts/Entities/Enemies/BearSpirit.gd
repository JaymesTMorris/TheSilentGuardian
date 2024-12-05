extends Spirit

@export var moveDirection: Vector2 = Vector2.RIGHT  # Direction to move (right)
var baseHP: float = 200 #This is pre-wave calculation
var baseAtk: float = 200 #This is pre-wave calculation
var baseSpd: float = 50

func _ready() -> void:
	# Initialize Spirit-specific properties
	var hp: float = baseHP*pow(1.1, (SpawnManager.currentWave-1)/2)
	var atk: float = baseHP*pow(1.1, (SpawnManager.currentWave-1)/3)
	initialize("BearSpirit", hp, baseSpd, createBearAttack(atk), sprite)

func _process(delta: float) -> void:
	# Continuously move in the specified direction
	move(moveDirection)
	
	# Check if the spirit reaches the village barrier
	if global_position.x >= getVillageBarrierXPos():
		HealthManager.takeDamage(attack.damage)
		queue_free()

func createBearAttack(atkDamage: float) -> Attack:
	# Create an instance of Spirit's attack
	var attack: Attack = Attack.new()
	attack.initialize("BearAttack", 200, 0, 0, 0, null)
	return attack

func getVillageBarrierXPos() -> float:
	# Retrieve the position of the village barrier
	var barrier: TileMapLayer = get_node("/root/Main/Map/VillageBarrier")
	if barrier == null:
		push_warning(self.name.to_upper()+": NO VILLAGE BARRIER FOUND")
		return 0
	return barrier.global_position.x
