extends StaticBody3D


#Removes the door when gets signal
func _on_area_3d_body_entered(body):
		queue_free()
