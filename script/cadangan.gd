extends CharacterBody2D

@onready var animation_tree = get_node('AnimationTree')
var attacking:bool = false
var health:int = 100
var dying:bool = false
var damage:int = 3

func _physics_process(delta) -> void:
	print(health)
	if Input.is_action_just_pressed("attack"):
		animation_tree.get("parameters/playback").travel("Attack")
		attacking = true
	
	if attacking == false:
		var input_vector = Vector2(
			Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
			Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
		).normalized()
		
		self.velocity = input_vector*delta*5000
		
		if input_vector == Vector2.ZERO :
			animation_tree.get("parameters/playback").travel("Idle")
		else :
			animation_tree.get("parameters/playback").travel("Move")
			animation_tree.set("parameters/Idle/BlendSpace2D/blend_position", input_vector)
			animation_tree.set("parameters/Attack/BlendSpace2D/blend_position", input_vector)
			animation_tree.set("parameters/Move/BlendSpace2D/blend_position", input_vector)
		move_and_slide()

func hit(damage):
	health -= damage
	if health <= 0:
		dying = true
		self.queue_free()


func _on_animation_tree_animation_finished(anim_name: StringName) -> void:
	if "attack" in anim_name:
		attacking = false

func bensin_diambil(skala:float):
	$PointLight2D.texture_scale = skala


func _on_attack_dectetor_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("Enemy"):
		body.hit(damage) 
