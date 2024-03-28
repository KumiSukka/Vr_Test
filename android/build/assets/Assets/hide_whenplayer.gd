extends Area3D

#Hides item when player is close to area in this case

func  _ready():
	visible = false
func _on_body_entered(body):
	visible = true


func _on_body_exited(body):
	visible = false
