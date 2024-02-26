extends XRController3D

 
@onready var PickUp = $FunctionPickup
@onready var Pointer = $FunctionPointer
@onready var timer = $Timer
@export var by_input : String = "by_button" #Must be string otherwise takes all inputs for some reason
var stance_cooldown = false


		#repeats twice figure out why???
func stanceSwap():
	if (PickUp.enabled == true):
			stance_cooldown = true
			PickUp.enabled = false
			PickUp.visible = false
			print("PickUp disabled")
	else:
			stance_cooldown = true
			PickUp.enabled = true
			PickUp.visible = true
			print("PickUp enabled")
	if (Pointer.enabled == true):
		stance_cooldown = true
		Pointer.enabled = false
		Pointer.visible = false
	else:
		stance_cooldown = true
		Pointer.enabled = true
		Pointer.visible = true
		

func _process(delta):
	if is_button_pressed(by_input):
		if stance_cooldown == true:
			timer.start()
		else:
			print("by painettu")
			stanceSwap()


#With this timer we should get short cooldown with swapping stances hopefully a fixt to it spamming stances
func _on_timer_timeout():
	stance_cooldown = false
