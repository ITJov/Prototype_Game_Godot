extends CharacterBody2D

@export var player: CharacterBody2D
@onready var animation_tree = get_node("AnimationTree")
@onready var hit_detector = get_node("Hit Detector/CollisionShape2D")
@onready var animation_state = animation_tree.get("parameters/playback")
@onready var animation_player = get_node("AnimationPlayer")
@onready var health_bar = get_node("HealthBar") 
@onready var troll3 = $troll3

enum mobState {
	IDLE,
	WALKING,
	CHASING,
	ATTACKING,
	DEATH
}

var speed: int = 3000
var current_state
var damage: int = 5
var health: int = 20  # Health awal musuh
var max_health: int = 20  # Maksimal health musuh


func _ready():	
	current_state = mobState.IDLE
	if animation_state:
		animation_state.travel("Idle")
	
	health_bar.max_value = max_health
	health_bar.value = health
	print("Enemy HealthBar Initialized: Max Health =", max_health, ", Current Health =", health)

func _physics_process(delta):
	if not is_instance_valid(player):
		return

	var direction = (player.global_position - global_position).normalized()
	print(health)
	
	match current_state:
		mobState.IDLE:
			velocity = Vector2.ZERO
			if animation_state:
				animation_state.travel("Idle")
			animation_tree.set("parameters/Idle/BlendSpace2D/blend_position", direction)
		mobState.WALKING:
			velocity = direction * speed * delta
			if animation_state:
				animation_state.travel("Walk")
			animation_tree.set("parameters/Walk/BlendSpace2D/blend_position", direction)
		mobState.CHASING:
			velocity = direction * speed * delta
			if animation_state:
				animation_state.travel("Chasing")
			animation_tree.set("parameters/Chasing/BlendSpace2D/blend_position", direction)
		mobState.ATTACKING:
			velocity = Vector2.ZERO
			if animation_state:
				animation_state.travel("Attack")
			animation_tree.set("parameters/Attack/BlendSpace2D/blend_position", direction)
		mobState.DEATH:
			velocity = Vector2.ZERO
			if animation_state:
				animation_state.travel("Death")
			animation_tree.set("parameters/Death/BlendSpace2D/blend_position", direction)

	move_and_slide()

func hit(damage):
	print("Enemy Hit! Damage =", damage)  # Debugging log
	health -= damage  # Kurangi health musuh
	if health < 0:
		health = 0  # Pastikan health tidak negatif
	update_health_bar()  # Perbarui Health Bar

	if health <= 0:
		current_state = mobState.DEATH
		print("Enemy Died!")  # Debugging log

func update_health_bar():
	health_bar.value = health  # Update nilai di ProgressBar
	print("Enemy Health Updated: Current Health =", health, " | HealthBar Value =", health_bar.value)  # Debugging log

func _on_player_detector_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		current_state = mobState.CHASING

func _on_player_detector_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		current_state = mobState.IDLE

func _on_hit_detector_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.hit(damage)

func _on_attack_dectetor_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		current_state = mobState.ATTACKING

func _on_attack_dectetor_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		current_state = mobState.CHASING 

func _on_animation_tree_animation_finished(anim_name: StringName) -> void:
	if "death" in anim_name:
		queue_free()
