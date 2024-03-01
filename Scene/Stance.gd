extends XRController3D

 
@onready var PickUp = $FunctionPickup
@onready var Pointer = $FunctionPointer
@onready var timer = $Timer
@export var by_input : String = "by_button" #Must be string otherwise takes all inputs for some reason
var stance_cooldown = false
		#repeats twice figure out why???
		
func _ready():
	stanceSwap()
func stanceSwap():
	if (PickUp.enabled == true):
			stance_cooldown = true
			PickUp.enabled = false
			PickUp.visible = false
	else:
			PickUp.enabled = true
			PickUp.visible = true
	if (Pointer.enabled == true):
		stance_cooldown = true
		Pointer.enabled = false
		Pointer.visible = false
	else:
		Pointer.enabled = true
		Pointer.visible = true
		

func _process(delta):
	if is_button_pressed(by_input):
		if stance_cooldown == true:
			print("stance cooldown")
			timer.start()
		else:
			print("stance swapped")
			stanceSwap()


#With this timer we should get short cooldown with swapping stances hopefully a fixt to it spamming stances
func _on_timer_timeout():
	stance_cooldown = false
