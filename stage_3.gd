extends Node2D

@onready var player = $Player_Orang  # Referensi ke karakter player # Node Area2D untuk efek slow
@onready var pit_area = $Pit  # Node Area2D untuk jurang
@onready var timer = $Stage  # Referensi ke Timer untuk penghitungan waktu

func _ready():
	# Hubungkan sinyal dari area Pit (jurang)
	pit_area.connect("body_entered", Callable(self, "_on_Pit_body_entered"))

func _physics_process(delta: float) -> void:
	pass

func _on_pit_body_entered(body: Node2D) -> void:
	# Periksa apakah body yang masuk adalah player
	if body == player:
		print("Player fell into the pit. Game Over!")
		player.game_over()  # Matikan player dan panggil game over


func _on_stage_timeout() -> void:
	player.game_over()  # Panggil fungsi game_over dari player


func _on_bensin_timer_timeout() -> void:
	$Player_Orang/PointLight2D.texture_scale = 0.1
