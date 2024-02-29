extends CanvasLayer



func _on_button_pressed():
	_change_to_range()

func _change_to_range():
	get_tree().change_scene_to_file("res://Scene/shooting_range.tscn")
