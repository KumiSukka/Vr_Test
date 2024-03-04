extends Node3D


func _ready():
	visible = false




func _on_detectplayer_body_entered(body):
	visible = true


func _on_detectplayer_body_exited(body):
	visible = false
