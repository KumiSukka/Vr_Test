extends XRToolsPickable
var can_hit = true
var velocity : Vector3
@onready var timer = $Timer
@onready var hitarea = $hitbox
@onready var collider = $bat

func _physics_process(delta):
	var collision_info = move_and_collide(velocity * delta)
	if collision_info && can_hit:
		can_hit = false
		timer.start()
		hitarea.disabled = true
		collider.disabled = true
		set_collision_layer_value ( 25, false )
		
	else :
		pass
func _on_timer_timeout():
	can_hit = true
	hitarea.disabled = false
	collider.disabled = false
	set_collision_layer_value ( 25, true )

	pass # Replace with function body.
