extends CharacterBody2D

@export var speed: float = 200
@export var jump_force: float = 400
@export var gravity: float = 1000

var is_jumping = false
var can_double_jump = false  # Track if double jump is available

func _physics_process(delta: float) -> void:
	# Get input for horizontal and vertical movement
	var h = Input.get_axis("left", "right")
	var v = Input.get_axis("backward", "forward")

	# Update the velocity based on input
	velocity.x = h * speed
	velocity.y = v * speed

	# Apply gravity if character is not on the floor
	if not is_on_floor():
		velocity.y += gravity * delta

	# Update animation based on action (assuming you have this function defined)
	#update_animation(h, v)
	
	# Move the character
	#move_and_slide(velocity)
