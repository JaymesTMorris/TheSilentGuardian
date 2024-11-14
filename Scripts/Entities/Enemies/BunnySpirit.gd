extends Spirit

@export var move_direction: Vector2 = Vector2.RIGHT  # Direction to move (right)

func _ready() -> void:
	# Set initial speed and start animation
	speed = 100.0

# Continuously move to the right
func _process(delta: float) -> void:
	move(move_direction)
