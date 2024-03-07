extends XRToolsPickable
var can_hit = true
var velocity : Vector3
@onready var timer = $Timer

func _physics_process(delta):
	var collision_info = move_and_collide(velocity * delta)
	if collision_info && can_hit:
		can_hit = false
		timer.start()
		disable_mode = CollisionObject3D.DISABLE_MODE_KEEP_ACTIVE
	else :
		pass

func _on_timer_timeout():
	can_hit = true
	disable_mode = CollisionObject3D.DISABLE_MODE_REMOVE
	pass # Replace with function body.
