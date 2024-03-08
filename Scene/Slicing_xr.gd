extends Node3D


@onready var player = $XROrigin3D

var mesh_slicer = MeshSlicer.new()
var CrossSection = load("res://Cross_Section.tres")
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

func  slice():
	var Transform = $MeshInstance3D.global_transform
	var MeshInstance = $MeshInstance3D2
	
	Transform.origin = $MeshInstance3D2.to_local(Transform.origin)
	Transform.basis.x = $MeshInstance3D2.to_local(Transform.basis.x + MeshInstance.global_position)
	Transform.basis.y = $MeshInstance3D2.to_local(Transform.basis.y + MeshInstance.global_position)
	Transform.basis.z = $MeshInstance3D2.to_local(Transform.basis.z + MeshInstance.global_position)
	var meshes = mesh_slicer.slice_mesh(Transform,MeshInstance.mesh, CrossSection)
	$MeshInstance3D3.visible = true
	
	MeshInstance.mesh = meshes[0]
	$MeshInstance3D3.mesh = meshes[1]


func _on_timer_timeout():
	slice()
	
