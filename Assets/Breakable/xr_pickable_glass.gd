extends XRToolsPickable
@onready var Breakable = $Breakable_Bottle
var velocity = Vector3.ZERO
var can_break: bool = false
@onready var canbreaktime = $canbreak


func drop():
		canbreaktime.start()
	

#crashes when done trough physics engine so well just call it trough area wiht collission / possibly too muhc on physics engine load with object breaking and so on
#func _physics_process(delta):
#	if (can_break == true):
#			var collision_info = move_and_collide(velocity * delta)
#			if collision_info:
#				var collision_point = collision_info.get_position()
#				Breakable.explode()
#	pass
		
		
		
		


func _on_dropped(pickable):
	canbreaktime.start()




func _on_canbreak_timeout():
	Breakable.shatter = true
