extends Node2D
var current_dir = 'none'

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta) -> void:
	if(Input.is_action_pressed("ui_right")):
		current_dir = 'right'
		play_animation(1)
		$Player_Orang.move_and_collide(Vector2(1.3,0))
		#print("kanan")
	elif(Input.is_action_pressed("ui_left")):
		current_dir = 'left'
		play_animation(1)
		$Player_Orang.move_and_collide(Vector2(-1.3,0))
		#print("kiri")
	elif(Input.is_action_pressed("ui_up")):
		current_dir = 'up'
		play_animation(1)
		$Player_Orang.move_and_collide(Vector2(0,-1.3))
		#print("atas")
	elif(Input.is_action_pressed("ui_down")):
		current_dir = 'down'
		play_animation(1)
		$Player_Orang.move_and_collide(Vector2(0,1.3))
		#print("bawah")
	else:
		play_animation(0)
	pass

func play_animation(movement):
	var dir = current_dir
	var animation = $Player_Orang/Karakter
	
	match movement:
		1:
			match dir :
				'right':
					animation.play('right')
				'left':
					animation.play('left')
				'up':
					animation.play('backward')
				'down':
					animation.play('forward')
		0:
			match dir :
				'right':
					animation.play('idle_right')
				'left':
					animation.play('idle_left')
				'up':
					animation.play('idle_backward')
				'down':
					animation.play('idle_forward')
			

## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#if(Input.is_action_pressed("ui_right")):
		#$Player.position = $Player.position + Vector2(10,0)
		#print("kanan")
	#elif(Input.is_action_pressed("ui_left")):
		#$Player.position = $Player.position + Vector2(-10,0)
		#print("kiri")
	#elif(Input.is_action_pressed("ui_up")):
		#$Player.position = $Player.position + Vector2(0,-10)
		#print("atas")
	#elif(Input.is_action_pressed("ui_down")):
		#$Player.position = $Player.position + Vector2(0,10)
		#print("bawah")
	#pass


func dapet_bensin(body: Node2D) -> void:
	$Bensin.queue_free()
	$Player_Orang/PointLight2D.texture_scale = 0.15
	$Timer.start()
	pass # Replace with function body.


func bensin_habis() -> void:
	$Player_Orang/PointLight2D.texture_scale = 0.1
	print('besin habis')
	pass # Replace with function body.
