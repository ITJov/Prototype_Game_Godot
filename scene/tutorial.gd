extends Control

@export var tutorial_content = [
	{"key": "W", "description": "Untuk bergerak maju"},
	{"key": "A", "description": "Untuk bergerak ke kiri"},
	{"key": "S", "description": "Untuk bergerak mundur"},
	{"key": "D", "description": "Untuk bergerak ke kanan"},
	{"key": "F", "description": "Untuk menyerang"},
	{"key": "Lmouse", "description": "Untuk interaksi dengan tombol"},
]

func _ready():
	# Ambil reference ke VBoxContainer
	var container = $MarginContainer/VBoxContainer  # Sesuaikan path
	if container == null:
		print("Error: VBoxContainer tidak ditemukan!")
		return

	# Pastikan jumlah Panel sesuai dengan jumlah konten tutorial
	if container.get_child_count() != tutorial_content.size():
		print("Error: Jumlah Panel dan tutorial_content tidak cocok!")
		return

	# Isi setiap Panel dengan teks dari tutorial_content
	for i in range(tutorial_content.size()):
		var panel = container.get_child(i)  # Ambil Panel
		if panel and panel is Panel:
			var label = panel.get_child(0)  # Ambil Label di dalam Panel
			if label and label is Label:
				label.text = tutorial_content[i]["key"] + " - " + tutorial_content[i]["description"]


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scene/menu.tscn")
	pass # Replace with function body.
