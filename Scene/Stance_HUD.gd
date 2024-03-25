extends CanvasLayer

@onready var label_left =  $Control/ColorRect/CenterContainer/Label
@onready var label_right =  $Control/ColorRect2/CenterContainer/Label
@onready var hud = $Control

@onready var hud_cooldown = $HideUi

func hide_hud():
	hud.visible = false

	
func left_stance():
	if label_left.text == "PickUp":
		label_left.text = "Pointer"
	else:
		label_left.text = "PickUp"
	show_hud()
	hud_cooldown.start()

func right_stance():
	if label_right.text == "PickUp":
		label_right.text = "Pointer"
	else:
		label_right.text = "PickUp"
	show_hud()
	hud_cooldown.start()

func show_hud():
	hud.visible = true


func _on_hide_ui_timeout():
	hide_hud()


func _on_timer_l_timeout():
	left_stance()
	show_hud()


func _on_timer_r_timeout():
	right_stance()
	show_hud()
