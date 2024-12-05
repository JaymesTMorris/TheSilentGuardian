extends Spirit

@export var moveDirection: Vector2 = Vector2.RIGHT  # Direction to move (right)
var baseHP: float = 1000 #Bat's health does not scale
var baseAtk: float = 100 #This is pre-wave calculation
var baseSpd: float = 300 #This is pre-wave calculation

func _ready() -> void:
	# Initialize Spirit-specific properties
	var atk: float = baseAtk*pow(1.1, (SpawnManager.currentWave-1)/10)
	var speed: float = baseAtk*pow(1.1, (SpawnManager.currentWave-1)/2)
	initialize("BearSpirit", baseHP, speed, createBearAttack(atk), sprite)

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
