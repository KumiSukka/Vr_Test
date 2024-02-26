extends RigidBody3D
class_name bellet

var is_sticking = false

var velocity = Vector3.ZERO
func destroy_bellet():
	queue_free()


func _on_bullet_cooldown_timeout():
	destroy_bellet() # Destroys bullet

func  _ready():		#Monitoring script setting for contacts
	set_contact_monitor(true)
	set_max_contacts_reported(5)
	set_use_custom_integrator(false)

#Handling physics and regitering collission point
func _physics_process(delta):
	var collision_info = move_and_collide(velocity * delta)
	if collision_info:
		var collision_point = collision_info.get_position()
		print("Collission occured at: ", collision_point)
		set_use_custom_integrator(true)
		set_linear_velocity (Vector3.ZERO)
		set_angular_velocity (Vector3.ZERO)
		
func projectile():
	pass
