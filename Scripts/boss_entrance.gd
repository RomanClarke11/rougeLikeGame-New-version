extends Node2D

const mainLevel = "res://Scenes/main_level.tscn"

func _on_portal_body_entered(body):
	pass # Replace with function body.


func _on_portal_2_body_entered(body):
	get_tree().change_scene_to_file(mainLevel)
