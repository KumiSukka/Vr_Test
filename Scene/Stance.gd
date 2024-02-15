extends XRController3D

 
@onready var PickUp = $FunctionPickup
@onready var Pointer = $FunctionPointer
@export var by_input : String = "by_button" #Must be string otherwise takes all inputs for some reason



		#repeats twice figure out why???
func stanceSwap():
	if (PickUp.enabled == true):
			PickUp.enabled = false
			PickUp.visible = false
			print("PickUp disabled")
	else:
			PickUp.enabled = true
			PickUp.visible = true
			print("PickUp enabled")
	if (Pointer.enabled == true):
		Pointer.enabled = false
		Pointer.visible = false
	else:
		Pointer.enabled = true
		Pointer.visible = true
		

func _process(delta):
	if is_button_pressed(by_input):
		print("by painettu")
		stanceSwap()
