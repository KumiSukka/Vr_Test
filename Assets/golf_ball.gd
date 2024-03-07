extends RigidBody3D

@export var max_speed = 4
@export var accel = 5
var velocity : Vector3
var speed : Vector3
var direction : Vector3
var can_get_hit = true
@onready var timer = $Timer




func _physics_process(delta):
	var collision_info = move_and_collide(velocity * delta)
	if collision_info && can_get_hit:
		apply_impulse(collision_info.get_normal() / max_speed)
		can_get_hit = false
		timer.start()
		
	else:
		pass
	



func _on_timer_timeout():
	can_get_hit = true
	pass
