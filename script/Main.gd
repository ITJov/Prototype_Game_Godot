extends Node2D

@onready var player = $Player_Orang  # Referensi ke karakter player
@onready var slow_area = $Slow  # Node Area2D untuk efek slow
@onready var pit_area = $Pit  # Node Area2D untuk jurang
@onready var timer = $Timer  # Referensi ke Timer untuk penghitungan waktu

func _ready():
	# Hubungkan sinyal dari area Slow
	slow_area.connect("body_entered", Callable(self, "_on_Slow_body_entered"))
	slow_area.connect("body_exited", Callable(self, "_on_Slow_body_exited"))
	
	# Hubungkan sinyal dari area Pit (jurang)
	pit_area.connect("body_entered", Callable(self, "_on_Pit_body_entered"))

func _on_Slow_body_entered(body: Node2D) -> void:
	# Periksa apakah body yang masuk adalah player
	if body == player:
		player.set_slow(true)  # Aktifkan slow pada karakter
		print("Player entered slow area. Movement slowed.")

func _on_Slow_body_exited(body: Node2D) -> void:
	# Periksa apakah body yang keluar adalah player
	if body == player:
		player.set_slow(false)  # Matikan slow pada karakter
		print("Player exited slow area. Movement back to normal.")

func _on_Pit_body_entered(body: Node2D) -> void:
	# Periksa apakah body yang masuk adalah player
	if body == player:
		print("Player fell into the pit. Game Over!")
		player.game_over()  # Matikan player dan panggil game over

func _on_timer_timeout() -> void:
	player.game_over()  # Panggil fungsi game_over dari player
