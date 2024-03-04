extends Node3D

@onready var viewport = $Viewport2Din3D


func _process(delta):
	

func _on_detectplayer_body_entered(body):
	viewport.visible = true


func _on_detectplayer_body_exited(body):
	viewport.visible = false
