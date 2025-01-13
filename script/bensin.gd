extends Area2D
@export var player: CharacterBody2D
@export var timer : Timer
@onready var point_light = get_node("../Player_Orang/PointLight2D")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimationPlayer.play("idle")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		queue_free() 
		point_light.texture_scale = 0.15
		timer.start()  
