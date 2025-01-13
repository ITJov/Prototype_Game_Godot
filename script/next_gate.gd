extends Area2D

@export var scene_tujuan: PackedScene

# Fungsi untuk berpindah level, dipanggil menggunakan call_deferred untuk menghindari error
func PindahLevel() -> void:
	call_deferred("_pindah_level")

# Fungsi privat yang benar-benar melakukan perpindahan level
func _pindah_level() -> void:
	if scene_tujuan != null:  # Pastikan scene_tujuan sudah diatur
		get_tree().change_scene_to_packed(scene_tujuan)
		print("Scene switched successfully to:", scene_tujuan.resource_path)
	else:
		print("Error: scene_tujuan is not set!")

# Fungsi yang dipanggil ketika body memasuki area
func _on_body_entered(body: Node2D) -> void:
	print("Body entered:", body.name)  # Debugging
	if body.is_in_group("player"):  # Memeriksa apakah objek yang masuk adalah player
		print("Player detected, switching scene...")
		PindahLevel()
