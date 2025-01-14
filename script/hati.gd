extends Area2D

@export var player: CharacterBody2D

func _ready() -> void:
	$AnimationPlayer.play("idle")

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.health += 50
		if body.health >= 150:
			body.health = 150
		body.update_health_bar()
		print(body.health)
		queue_free()
