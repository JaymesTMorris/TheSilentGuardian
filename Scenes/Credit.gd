extends Control

# Speed of the scrolling credits
@export var scroll_speed = 50.0  # Pixels per second

# Reference to the VBoxContainer (where credits text is)
@onready var credits_container = $ScrollContainer/VBoxContainer

# Initial position
var start_position = 0.0

func _ready() -> void:
	# Set the initial position of the credits to the bottom of the screen
	start_position = $ScrollContainer.rect_size.y
	credits_container.rect_position = Vector2(0, start_position)
	set_process(true)

func _process(delta):
	# Move the credits upward
	credits_container.rect_position.y -= scroll_speed * delta
	
	# Reset or stop scrolling when it finishes
	if credits_container.rect_position.y + credits_container.rect_size.y < 0:
		# Optionally reset for looping:
		# credits_container.rect_position.y = start_position
		# Or stop the scrolling:
		set_process(false)
		# Emit a signal or change the scene
