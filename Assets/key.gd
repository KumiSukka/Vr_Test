extends XRToolsPickable

#Key destroys when entering area itself
func _on_area_3d_body_entered(body):
		queue_free()
