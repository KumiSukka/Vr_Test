extends Node3D


@onready var player = $XROrigin3D
@onready var slicer = $Slicer
@onready var slice_area = $Slicer/mesh
@onready var timer = $Slice_delay
var meshSlicer = MeshSlicer.new()
var CrossSection = load("res://Cross_Section.tres")
var xr_interface: XRInterface
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
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

#func  slice():
	#var Transform = $MeshInstance3D.global_transform
	#var MeshInstance = $MeshInstance3D2
	#
	#Transform.origin = $MeshInstance3D2.to_local(Transform.origin)
	#Transform.basis.x = $MeshInstance3D2.to_local(Transform.basis.x + MeshInstance.global_position)
	#Transform.basis.y = $MeshInstance3D2.to_local(Transform.basis.y + MeshInstance.global_position)
	#Transform.basis.z = $MeshInstance3D2.to_local(Transform.basis.z + MeshInstance.global_position)
	#var meshes = mesh_slicer.slice_mesh(Transform,MeshInstance.mesh, CrossSection)
	#$MeshInstance3D3.visible = true
	#
	#MeshInstance.mesh = meshes[0]
	#
func slice_automatic():
	for body in $Slicer/Area3D.get_overlapping_bodies().duplicate():
			if body is RigidBody3D:
				
				
				#The plane transform at the rigidbody local transform
				var meshinstance = body.get_node("MeshInstance3D")
				var Transform = Transform3D.IDENTITY
				Transform.origin = meshinstance.to_local((slicer.global_transform.origin))
				Transform.basis.x = meshinstance.to_local((slicer.global_transform.basis.x+body.global_position))
				Transform.basis.y = meshinstance.to_local((slicer.global_transform.basis.y+body.global_position))
				Transform.basis.z = meshinstance.to_local((slicer.global_transform.basis.z+body.global_position))
				
				#Change freeze of if enabled

				

				var collision = body.get_node("CollisionShape3D")
				
				
				#Slice the mesh
				var meshes = meshSlicer.slice_mesh(Transform,meshinstance.mesh,CrossSection)
				

				meshinstance.mesh = meshes[0]
				
				#generate collision
				if len(meshes[0].get_faces()) > 2:
					collision.shape = meshes[0].create_convex_shape()




				
				#adjust the rigidbody center of mass
				body.center_of_mass_mode = 1
				body.center_of_mass = body.to_local(meshinstance.to_global(calculate_center_of_mass(meshes[0])))

				
				#second half of the mesh
				var body2 = body.duplicate()
				$"RigidBodys".add_child(body2)
				meshinstance = body2.get_node("MeshInstance3D")
				collision = body2.get_node("CollisionShape3D")
				meshinstance.mesh = meshes[1]
				
				if body2.freeze == true:
					body2.freeze = false
				else:
					pass
				
				#generate collision
				if len(meshes[1].get_faces()) > 2:
					collision.shape = meshes[1].create_convex_shape()

				#get mesh size
				var aabb = meshes[0].get_aabb()
				var aabb2 = meshes[1].get_aabb()
				#queue_free() if the mesh is too small
				if aabb2.size.length() < 0.5:
					body2.queue_free()
				if aabb.size.length() < 0.5:
					body.queue_free()
					
				#adjust the rigidbody center of mass
				body2.center_of_mass = body2.to_local(meshinstance.to_global(calculate_center_of_mass(meshes[1])))

func calculate_center_of_mass(mesh:ArrayMesh):
	#Not sure how well this work
	var meshVolume = 0
	var temp = Vector3(0,0,0)
	var x : float = 3.0
	for i in range(len(mesh.get_faces())/x):
		var v1 = mesh.get_faces()[i]
		var v2 = mesh.get_faces()[i+1]
		var v3 = mesh.get_faces()[i+2]
		var center = (v1 + v2 + v3) / 3
		var volume = (Geometry3D.get_closest_point_to_segment_uncapped(v3,v1,v2).distance_to(v3)*v1.distance_to(v2))/2
		meshVolume += volume
		temp += center * volume
	
	if meshVolume == 0:
		return Vector3.ZERO
	return temp / meshVolume

func _physics_process(delta):
	if Input.is_action_just_pressed("key_pressed"):
		slice_automatic()
		


func _on_slicer_action_pressed(pickable):
	slice_automatic()
	slice_area.visible = true
	timer.start()


func _on_slice_delay_timeout():
	slice_area.visible = false
