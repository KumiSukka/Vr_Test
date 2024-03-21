extends XRController3D

 
@onready var Flight = $MovementFlight
@export var by_input : String = "by_button" #Must be string otherwise takes all inputs for some reason

func disable_flight():
	Flight.enabled = false

func enable_flight():
	Flight.enabled = true
