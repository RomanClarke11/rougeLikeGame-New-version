extends Node2D
const mainLevel = "res://Scenes/main_level.tscn"
var path = "user://data"

func _on_button_2_pressed():
	if FileAccess.file_exists(path):
		Inventory.load_game()
		get_tree().change_scene_to_file(mainLevel)
	else:
		print_debug("no save")

func _on_button_pressed():
	Inventory.create_new_save()
	get_tree().change_scene_to_file(mainLevel)
