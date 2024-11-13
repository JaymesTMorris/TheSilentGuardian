extends CharacterBody2D

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
	
	# Move the player
	move_and_slide()
