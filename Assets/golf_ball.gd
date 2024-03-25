extends RigidBody3D

@export var max_speed = 2
@export var accel = 5
var velocity : Vector3
var speed : Vector3
var direction : Vector3
var can_get_hit = true
@onready var timer = $Timer



#In physics process here we calculate trough physics process that the ball gets hit so we multiple velocity with delta and disable collission for short time so it wont get multiple hit registrations
func _physics_process(delta):
	var collision_info = move_and_collide(velocity * delta)
	if collision_info && can_get_hit:
		apply_impulse(collision_info.get_normal())
		can_get_hit = false
		set_collision_layer_value ( 25, false )
		set_collision_mask_value ( 25, false )
		timer.start()
	else:
		pass
	


#Here after time we reaneble collissions
func _on_timer_timeout():
	can_get_hit = true
	set_collision_layer_value ( 25, true )
	set_collision_mask_value ( 25, true )
	pass
