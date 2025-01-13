extends Node2D

@onready var player = $Player_Orang
@onready var timer = $Timer


func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta) -> void:
	pass
	
	

func _on_timer_timeout() -> void:
	$Player_Orang/PointLight2D.texture_scale = 0.1
