extends Control



func _on_button_pressed():
	_my_level_was_completed()

func _my_level_was_completed():
	get_tree().change_scene_to_file("res://Scene/main.tscn")
