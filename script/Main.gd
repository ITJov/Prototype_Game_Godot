extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta) -> void:
	if(Input.is_action_pressed("ui_right")):
		$Player_Orang.move_and_collide(Vector2(10,0))
		print("kanan")
	elif(Input.is_action_pressed("ui_left")):
		$Player_Orang.move_and_collide(Vector2(-10,0))
		print("kiri")
	elif(Input.is_action_pressed("ui_up")):
		$Player_Orang.move_and_collide(Vector2(0,-10))
		print("atas")
	elif(Input.is_action_pressed("ui_down")):
		$Player_Orang.move_and_collide(Vector2(0,10))
		print("bawah")
	pass

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
	pass # Replace with function body.
