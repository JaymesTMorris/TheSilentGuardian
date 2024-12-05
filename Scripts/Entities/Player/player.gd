extends CharacterBody2D

@onready var playerCamera: Camera2D = $Camera2D
@onready var globalCamera: Camera2D = get_node("/root/Main/Camera2D")

var usingPlayerCamera: bool
const SPEED: float = 200.0

func _physics_process(delta: float) -> void:
	# Get input directions for both horizontal and vertical axes
	var direction: Vector2 = Vector2(
		Input.get_axis("ui_left", "ui_right"),
		Input.get_axis("ui_up", "ui_down")
	)

	# Normalize the direction to avoid faster diagonal movement
	if direction != Vector2.ZERO:
		direction = direction.normalized()

	# Set velocity based on direction and speed
	velocity = direction * SPEED

	# Move the player with collision handling
	move_and_slide()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_interact"): # Keyboard [E]
		if EnergyManager.useEnergy(25):
			SpawnManager.spawnTower()
	# Commented out the ability start waves via [Space]/[Enter]	
	#if event.is_action_pressed("ui_accept"): # Keyboard [Space] or [Enter]
	#	SpawnManager.startNight()
	
	# Commented out the ability to toggle camera.
	#if event.is_action_pressed("toggle_camera"):
	#	toggleCamera()

	# Explicitly check for collisions and stop if a collision is detected
	if is_on_wall():
		velocity = Vector2.ZERO

func toggleCamera() -> void:
	if usingPlayerCamera:
		# Switch to the global camera
		playerCamera.enabled = false
		globalCamera.enabled = true
	else:
		# Switch back to the player camera
		globalCamera.enabled = false
		playerCamera.enabled = true
	
	usingPlayerCamera = !usingPlayerCamera
	#print("Using Player Camera:", usingPlayerCamera)
	
func _ready() -> void:
	# Ensure the player is using the scene camera
	playerCamera.enabled = false
	globalCamera.enabled = true
	usingPlayerCamera = false
	
	# Start the first wave
	SpawnManager.startNight()
	
