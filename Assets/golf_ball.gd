extends RigidBody3D

@export var max_speed = 8
@export var accel = 5
var velocity : Vector3
var speed : Vector3
var direction : Vector3


func _physics_process(delta):
	speed = - (direction * accel).limit_length(max_speed)
	shoot(speed)
	
func shoot(vector:Vector3):
	velocity = Vector3(vector.x,0, vector.z)
	
	self.apply_impulse(velocity, Vector3.ZERO)
