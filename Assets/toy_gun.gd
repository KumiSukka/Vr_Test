extends XRToolsPickable
@onready var shoot_point = $Shoot_point
@onready var input_cooldown = $Input_cooldown
var Bellet = preload("res://Assets/bellet.tscn")
@export var bellet_speed =  -12.0
var cooldown = true


#Spawning bellets/bullet
func _spawn_bellet():
	var spawned_bellet = Bellet.instantiate()
	owner.add_child(spawned_bellet)
	spawned_bellet.transform = $Shoot_point.global_transform
	spawned_bellet.linear_velocity = spawned_bellet.transform.basis.z * bellet_speed

func action():
		_spawn_bellet()
		input_cooldown.start()
		
func _on_input_cooldown_timeout():
	pass

