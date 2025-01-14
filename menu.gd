extends Control

@onready var colorRect = $ColorRect
@onready var animationPlayer = $AnimationPlayer

func _ready() -> void:
	colorRect.visible = true
	animationPlayer.play("fade")
	pass

func _on_play_pressed() -> void:
	$click.play()
	get_tree().change_scene_to_file("res://node_2d.tscn")
	animationPlayer.play("fade")
	
func _on_tutorial_pressed() -> void:
	$click.play()
	get_tree().change_scene_to_file("res://scene/tutorial.tscn")

func _on_quit_pressed() -> void:
	$click.play()
	get_tree().quit()  # Keluar dari game


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	$click.play()
	if anim_name == "fade":
		colorRect.visible = false
	pass # Replace with function body.
