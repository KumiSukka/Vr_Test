extends CanvasLayer



func _on_button_pressed():
	_change_to_range()

func _change_to_range():
	print("tp_to_range")
	get_tree().change_scene_to_file("res://Scene/shooting_range.tscn")


func _on_button_2_pressed():
	print("tp_to_climbing")
	get_tree().change_scene_to_file("res://Scene/Climbing_test.tscn")
