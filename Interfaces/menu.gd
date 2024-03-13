extends CanvasLayer



func _on_but_1_pressed():
	get_tree().change_scene_to_file("res://Scene/shooting_range.tscn")


func _on_but_2_pressed():
	get_tree().change_scene_to_file("res://Scene/Climbing_test.tscn")


func _on_but_3_pressed():
	get_tree().change_scene_to_file("res://Scene/mini_golf.tscn")


func _on_but_4_pressed():
	get_tree().change_scene_to_file("res://Scene/mesh_slicing.tscn")
