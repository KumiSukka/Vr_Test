extends RigidBody3D
class_name Fragment

#How long alive
@export var lifetime:float = 1
var elapsed_time:float = 0


func _ready():
	pass
	
	#Time for lifetime of sharts
func _process(delta):
	elapsed_time += delta
	if elapsed_time > lifetime:
		queue_free()
		
func init_from_mesh(source:MeshInstance3D):
	#global_transform = source.global_transform
	#global_position = source.global_position
	var mesh_inst:MeshInstance3D = source.duplicate()
	mesh_inst.transform = Transform3D.IDENTITY
	add_child(mesh_inst)
	
	$CollisionShape3D.shape = source.mesh.create_convex_shape()


