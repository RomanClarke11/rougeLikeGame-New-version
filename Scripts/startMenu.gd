extends Node2D
const mainLevel = "res://Scenes/main_level.tscn"
var save_path = "C:/Users/fjror/Desktop/rpgGameSave/sample1.json"

func _on_button_2_pressed():
	if FileAccess.file_exists(save_path):
		Inventory.loadGame = true
		get_tree().change_scene_to_file(mainLevel)
	else:
		print_debug("no save")

func _on_button_pressed():
	get_tree().change_scene_to_file(mainLevel)
