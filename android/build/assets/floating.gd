extends RigidBody3D

#Script to fake water physics

@export var float_force = 1.0 #Float force is how much force to go up from water
@export var water_drag = 0.05 #How much water slows the object when going up or being under 0
@export var water_angular_drag = 0.05 #How much water drags in anglular direction so how much it affects rotations

@onready var gravity = ProjectSettings.get_setting("physics/3d/default_gravity") #We get default gravity its 1 in y axel and its forces thats something like 9 m/s^2

const water_height = 0.2 # The heigt of water in theory should be just 0 , but 0.2 looks better with waves, one option would be analyze waves and change by that, but waves are so small that would be too demanding when this looks just fine

var submerged = false #Check to make its submerged

func _physics_process(delta):
	submerged = false
	var depth = water_height - global_position.y
	if depth > 0:
		submerged = true
		apply_central_force(Vector3.UP * float_force * gravity * depth) #Add force to go up until over water height, 

func _integrate_forces(state):
	if submerged:
		state.linear_velocity *= 1 - water_drag #When under water add drag to velocity
