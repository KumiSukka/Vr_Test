extends Node3D


@onready var player = $XROrigin3D
@onready var returnpoint = $Checkpoint
@onready var returnpoint2 = $Checkpoint2
@onready var returnpoint3 = $Checkpoint3

var current_return
var xr_interface: XRInterface


#Must run at stat to get xr point in godot
func _ready():
	xr_interface = XRServer.find_interface("OpenXR")
	if xr_interface and xr_interface.is_initialized():
		
		print("OpenXR initialized successfully")

		# Turn off v-sync!
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)

		# Change our main viewport to output to the HMD
		get_viewport().use_xr = true
	else:
		print("OpenXR not initialized, please check if your headset is connected")
	current_return = returnpoint.global_position



func _on_fall_catcher_body_entered(body):
	print(body)
	print(current_return)
	player.global_position = current_return.global_position


func _on_fall_catcher_body_exited(body):
	print(body)
	player.global_position = current_return.global_position


func _on_detect_player_body_entered(body):
	current_return = returnpoint.global_position
	print(current_return)
	


func _on_detect_player_2_body_entered(body):
	current_return = returnpoint2.global_position
	print(current_return)


func _on_detect_player_3_body_entered(body):
	current_return = returnpoint3.global_position
	print(current_return)
