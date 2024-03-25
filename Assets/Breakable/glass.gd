extends Node3D


@export_flags_3d_physics var fragment_collission_layer:int = 1 #Layers for fragments that we generate 
@export_flags_3d_physics var fragment_collission_mask:int = 1 #Masks for fragments that we generate 
@export var break_speed:float = 1 #How fast it breaks into junks
@export var min_frag_lifetime:float = 3 #Minimun lifetime
@export var max_frag_lifetime:float = 5 #Maximum lifetime
@onready var Glass_bottle_fractured = $glass_bottle_fractured #Fractured model that will be used for generating physics
@onready var breakOrigin = $origin #Where we spawns sharts
@export var shatter:bool = false





#Script for exploding the bottles
func explode():
	var parent = get_parent()
	Glass_bottle_fractured.visible = true
	queue_free()
	#Here we destroy orginal bottle then spawn another that handles the shards of glass
	
	for child in Glass_bottle_fractured.get_children():
		if child is MeshInstance3D:
			var frag:Fragment = preload("res://Assets/Breakable/fractured_glass.tscn").instantiate()
			frag.init_from_mesh(child)
			frag.collision_layer = fragment_collission_layer
			frag.collision_mask = fragment_collission_mask
			parent.add_child(frag)	
			#frag.position = parent.position  #these values break gravity
			#frag.transform = parent.global_transform   #these values break gravity
			frag.linear_velocity = Vector3.ZERO / break_speed
			frag.lifetime = randf_range(min_frag_lifetime, max_frag_lifetime)

func _on_area_3d_body_entered(_body):
	if shatter:
		explode()
