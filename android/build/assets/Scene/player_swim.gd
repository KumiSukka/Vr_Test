extends XRController3D

 
@onready var Flight = $MovementFlight
@onready var time = $Timer
@onready var sprite = $AnimatedSprite3D
@export var by_input : String = "by_button" #Must be string otherwise takes all inputs for some reason

func disable_flight():
	sprite.visible = true
	Flight.enabled = false
	time.start()
	sprite.frame = 0

func enable_flight():
	sprite.visible = true
	Flight.enabled = true
	time.start()
	sprite.frame = 1
	
func _process(delta):
	if is_button_pressed(by_input):
		sprite.visible = true
		time.start()

func _on_timer_timeout():
	sprite.visible = false


func _on_movement_flight_flight_finished():
	sprite.frame = 0


func _on_movement_flight_flight_started():
	sprite.frame = 1
