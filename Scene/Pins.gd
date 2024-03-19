extends Node3D

@onready var timer: Timer = $"../Reset_position"
@onready var monitor: Area3D = $"../Detect_Ball"

var array_position = []
var array_rotation = []
var child_lenght = 0
var fallen_lenght = 0
var _reset = false
var oddnumber = false
func _ready():
	for n in self.get_children():
		array_position.append(n.global_position)
		array_rotation.append(n.global_rotation)
func reset():
	for n in self.get_children():
		var positionZero: Vector3 =  array_position[child_lenght]
		n.position = positionZero
		n.rotation=Vector3.ZERO
		child_lenght += 1
		n.freeze = false
	child_lenght = 0
func hasfallen():
	for n in self.get_children():
		if (n.global_rotation.x >  0.7853981634) || (n.global_rotation.z >  0.7853981634) || (n.global_rotation.z <= -0.7853981634) || (n.global_rotation.x <= -0.7853981634):
			print("has fallen: ", n.rotation)
			fallen_lenght += 1
func _physics_process(delta):
	if Input.is_action_just_pressed("key_pressed"):
		for n in self.get_children():
			n.freeze = true
		reset()
	if _reset == true && oddnumber == true:
		for n in self.get_children():
			n.freeze = true
		reset()
		_reset = false
		oddnumber = false
		monitor.monitoring = true
	else :
		pass


func _on_reset_position_timeout():
	hasfallen()
	if oddnumber == true:
		_reset = true
	else:
		oddnumber = true


func _on_detect_ball_body_entered(body):
	timer.start()
	monitor.monitoring = false
