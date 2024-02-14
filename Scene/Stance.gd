extends XRController3D

@export var ax_input = "ax_button" #for somereason registers this as touch and not pressed
@onready var PickUp = $FunctionPickup
@onready var Pointer = $FunctionPointer





func _ready():
	print(PickUp)
	print(Pointer)

		
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
		



func _on_button_pressed(ax_input):
		print("ax_pressed")
		stanceSwap()
