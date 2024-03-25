extends XRToolsPickable

#Basic water physics script to fake physics in code rather than in gravity with areas like its done in player for pickable objects Same as regular rigidbody one -> Look into the regular one for proper comments

@export var float_force = 1.0
@export var water_drag = 0.05
@export var water_angular_drag = 0.05

@onready var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

const water_height = 0.4

var submerged = false

func _physics_process(delta):
	submerged = false
	var depth = water_height - global_position.y
	if depth > water_height:
		submerged = true
		apply_central_force(Vector3.UP * float_force * gravity * depth)

func _integrate_forces(state):
	if submerged:
		state.linear_velocity *= 1 - water_drag