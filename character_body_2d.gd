extends CharacterBody2D

@export var speed: float = 200
@export var jump_force: float = 400
@export var gravity: float = 1000

var is_jumping = false
var can_double_jump = false  # Track if double jump is available

func _physics_process(delta: float) -> void:
	# Apply gravity if the character is not on the floor
	if not is_on_floor():
		velocity.y += gravity * delta  # Gunakan gravity untuk konsisten
	else:
		is_jumping = false
		can_double_jump = true  # Reset double jump when back on the floor
	
	# Get input for horizontal movement
	var h = Input.get_axis("kiri", "kanan")
	velocity.x = h * speed

	# Jumping and double jump logic
	if is_on_floor() and Input.is_action_just_pressed("up"):
		# Regular jump
		velocity.y = -jump_force
		is_jumping = true
	elif can_double_jump and Input.is_action_just_pressed("up"):
		# Double jump
		velocity.y = -jump_force
		is_jumping = true
		can_double_jump = false  # Disable further jumps after double jump

	# Update animation based on action
	update_animation(h)
	
	# Move the character
	move_and_slide()

func update_animation(h: float) -> void:
	var anim_player = $axolotl  # Assumes you have an AnimationPlayer node attached

	if is_jumping:
		anim_player.play("jump")
	elif h != 0:
		anim_player.play("walk")
		if h < 0:  # Walking left (flip sprite)
			$axolotl.flip_h = true
		else:  # Walking right
			$axolotl.flip_h = false
	else:
		anim_player.play("idle")  # Stops animation when idle
