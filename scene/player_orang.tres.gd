extends CharacterBody2D

@onready var animation_tree = get_node("AnimationTree")
@onready var health_bar = get_node("HealthBar")  # Node ProgressBar untuk health bar

var attacking: bool = false
var health: int = 150  # Total health awal
var max_health: int = 150  # Total maksimal health
var dying: bool = false
var damage: int = 1  # Damage yang diterima per hit

func _ready():
	health_bar.max_value = max_health  # Atur nilai maksimal health bar
	health_bar.value = health  # Set nilai awal health bar
	print("HealthBar Initialized: ", health_bar.value)

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("attack"):
		animation_tree.get("parameters/playback").travel("Attack")
		attacking = true
	
	if not attacking:
		var input_vector = Vector2(
			Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
			Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
		).normalized()
		
		self.velocity = input_vector * delta * 5000
		
		if input_vector == Vector2.ZERO:
			animation_tree.get("parameters/playback").travel("Idle")
		else:
			animation_tree.get("parameters/playback").travel("Move")
			animation_tree.set("parameters/Idle/BlendSpace2D/blend_position", input_vector)
			animation_tree.set("parameters/Attack/BlendSpace2D/blend_position", input_vector)
			animation_tree.set("parameters/Move/BlendSpace2D/blend_position", input_vector)
		move_and_slide()

func hit(damage: int):
	print("Hit function called. Damage: ", damage)  # Debugging
	if dying:
		return

	health -= damage
	print("Health after hit: ", health)  # Debugging
	update_health_bar()

	if health <= 0:
		dying = true
		game_over()

func update_health_bar():
	health_bar.value = health  # Update nilai di ProgressBar
	print("Health Updated: ", health, " | HealthBar Value: ", health_bar.value)  # Debugging

func game_over():
	print("Game Over!")  # Tampilkan pesan Game Over
	get_tree().paused = true  # Hentikan semua aktivitas game

func _on_animation_tree_animation_finished(anim_name: StringName) -> void:
	if "attack" in anim_name:
		attacking = false

func _on_attack_dectetor_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("Enemy"):  # Jika terkena musuh
		print("Player hit by enemy!")  # Debugging
		hit(damage)
