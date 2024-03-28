extends WorldEnvironment


func _on_fog_activator_body_entered(body):
	environment.fog_enabled = true


func _on_fog_activator_body_exited(body):
	environment.fog_enabled = false
