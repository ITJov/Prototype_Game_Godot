extends CharacterBody2D


func _ready() -> void:
	
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta) -> void:
	if(Input.is_action_pressed("ui_right")):
		move_and_collide(Vector2(3,0))
		print("kanan")
	elif(Input.is_action_pressed("ui_left")):
		move_and_collide(Vector2(-3,0))
		print("kiri")
	elif(Input.is_action_pressed("ui_up")):
		move_and_collide(Vector2(0,-3))
		print("atas")
	elif(Input.is_action_pressed("ui_down")):
		move_and_collide(Vector2(0,3))
		print("bawah")
	pass

#func update_animation(h: float) -> void:
	#var anim_player = $forward  # Assumes you have an AnimationPlayer node attached
#
	#if h != 0:
		#anim_player.play("walk")
		#if h < 0:  # Walking left (flip sprite)
			#$axolotl.flip_h = true
		#else:  # Walking right
			#$axolotl.flip_h = false
	#else:
		#anim_player.play("idle")  # Stops animation when idle
