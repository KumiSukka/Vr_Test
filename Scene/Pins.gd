extends Node3D

@onready var timer: Timer = $"../Reset_position"
@onready var monitor: Area3D = $"../Detect_Ball"
var array_position = []
var child_lenght = 0
var _reset = false
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
	if _reset == true:
		for n in self.get_children():
			n.freeze = true
		reset()
		_reset = false
		monitor.monitoring = true
	else :
		pass


func _on_reset_position_timeout():
	_reset = true


func _on_detect_ball_body_entered(body):
	timer.start()
	monitor.monitoring = false
