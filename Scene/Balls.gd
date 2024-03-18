extends Node3D

var array_position = []
var child_lenght = 0
func _ready():
	for n in self.get_children():
		array_position.append(n.global_position)
func reset():
	for n in self.get_children():
		var positionZero: Vector3 =  array_position[child_lenght]
		n.position = positionZero
		n.rotation=Vector3.ZERO
		child_lenght += 1
		n.freeze = false
	child_lenght = 0
func _physics_process(delta):
	if Input.is_action_just_pressed("key_pressed"):
		for n in self.get_children():
			n.freeze = true
		reset()
		
	else :
		pass
