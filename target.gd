extends Node3D



func _on_hit_box_body_entered(body):
	if body.has_method("projectile"):
		print("osui")
		self.queue_free()
