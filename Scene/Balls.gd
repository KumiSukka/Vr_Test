extends Node3D

#Script to reset bowling ball positions
@onready var timer: Timer = $"../Reset_position" #Timer for resetting positions
@onready var monitor: Area3D = $"../Detect_Ball" #Area that starts timer to resets positions when it detects bowlingball/pins


var array_position = [] #Orginal positions are stored in this
var child_lenght = 0
var _reset = false

func _ready():
#We get the positions
	for n in self.get_children():
		array_position.append(n.global_position)

#This function resets the positions
func reset():
	for n in self.get_children():
		var positionZero: Vector3 =  array_position[child_lenght]
		n.position = positionZero
		n.rotation=Vector3.ZERO
		child_lenght += 1
		n.freeze = false
	child_lenght = 0
#contains test input & Logic to resetting
func _physics_process(delta):
	if Input.is_action_just_pressed("key_pressed"):
		for n in self.get_children():
			n.freeze = true
		reset()
	if _reset == true:
		for n in self.get_children():
			n.freeze = true
		reset()
		_reset = false
		monitor.monitoring = true
	else :
		pass

#Timer just gives reset true so it can reset in physics process
func _on_reset_position_timeout():
	_reset = true

#When this signal omits we start timer and make it so no signlas will be sent until reset happens
func _on_detect_ball_body_entered(body):
	timer.start()
	monitor.monitoring = false
