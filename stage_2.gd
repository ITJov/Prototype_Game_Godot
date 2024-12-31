extends Node2D

var current_dir = 'none'
var velocity = Vector2.ZERO  # Variabel untuk menyimpan kecepatan

func _physics_process(delta: float) -> void:
	velocity = Vector2.ZERO  # Reset kecepatan setiap frame
	
	# Cek input dan atur velocity
	if Input.is_action_pressed("ui_right"):
		current_dir = 'right'
		play_animation(1)
		velocity.x += 100  # Kecepatan di sumbu X (kanan)
	elif Input.is_action_pressed("ui_left"):
		current_dir = 'left'
		play_animation(1)
		velocity.x -= 100  # Kecepatan di sumbu X (kiri)
	elif Input.is_action_pressed("ui_up"):
		current_dir = 'up'
		play_animation(1)
		velocity.y -= 100  # Kecepatan di sumbu Y (atas)
	elif Input.is_action_pressed("ui_down"):
		current_dir = 'down'
		play_animation(1)
		velocity.y += 100  # Kecepatan di sumbu Y (bawah)
	else:
		play_animation(0)
	
	# Set kecepatan ke node Player_Orang2 dan panggil move_and_slide()
	$Player_Orang2.velocity = velocity  # Properti velocity di CharacterBody2D
	$Player_Orang2.move_and_slide()
	

func play_animation(movement):
	# Pastikan node Karakter benar-benar ada
	var animation = $Player_Orang2/Karakter  # Ganti sesuai struktur node Anda
	match movement:
		1:
			match current_dir:
				'right':
					animation.play('right')
				'left':
					animation.play('left')
				'up':
					animation.play('backward')
				'down':
					animation.play('forward')
		0:
			match current_dir:
				'right':
					animation.play('idle_right')
				'left':
					animation.play('idle_left')
				'up':
					animation.play('idle_backward')
				'down':
					animation.play('idle_forward')
