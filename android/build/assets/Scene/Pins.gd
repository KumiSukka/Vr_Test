extends Node3D

@onready var timer: Timer = $"../Reset_position"
@onready var check: Timer = $"../Check_fallen"
@onready var monitor: Area3D = $"../Detect_Ball"

var array_position = [] #map pin positions
var array_rotation = [] #map pin rotations
var child_lenght = 0
var fallen_lenght = 0
var _reset = false
var oddnumber = false #Checking for oddnumber so we know if its second throw

func _ready(): #here we map locations and rotations
	for n in self.get_children():
		array_position.append(n.global_position)
		array_rotation.append(n.global_rotation)

func reset(): #function for resetting pins by rotation and location
	for n in self.get_children():
		var positionZero: Vector3 =  array_position[child_lenght]
		n.position = positionZero
		n.rotation=Vector3.ZERO
		child_lenght += 1
		n.freeze = false
	child_lenght = 0
func hasfallen(): #check how many pins have fallen with certain radian value
	for n in self.get_children():
		if (n.global_rotation.x >  0.7853981634) || (n.global_rotation.z >  0.7853981634) || (n.global_rotation.z <= -0.7853981634) || (n.global_rotation.x <= -0.7853981634):
			print("has fallen: ", n.rotation)
			fallen_lenght += 1
	if fallen_lenght == 10: #if 10 pins fallen we reset all pins
		print("kaatui: ", fallen_lenght)
		oddnumber = true
	else:
		print(fallen_lenght)
		fallen_lenght = 0
		
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
	if oddnumber == true:
		_reset = true
	else:
		oddnumber = true


func _on_detect_ball_body_entered(body):
	timer.start()
	check.start()
	monitor.monitoring = false


func _on_check_fallen_timeout():
	hasfallen()
