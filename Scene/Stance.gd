extends XRController3D

 
@onready var PickUp = $FunctionPickup
@onready var Pointer = $FunctionPointer
@onready var timer = $Timer
@onready var Sprite = $AnimatedSprite3D
@onready var Hud = $HUD
@export var by_input : String = "by_button" #Must be string otherwise takes all inputs for some reason
var stance_cooldown = false
		#repeats twice figure out why???
		
func _ready():
	stanceSwap()

#could be done better but works for now and hard to map in my head
func stanceSwap():
	Sprite.visible = true
	Hud.start()
	if (PickUp.enabled == true):
			Sprite.frame = 0
			stance_cooldown = true
			PickUp.enabled = false
			PickUp.visible = false
	else:
			Sprite.frame = 1
			PickUp.enabled = true
			PickUp.visible = true
	if (Pointer.enabled == true):
		Sprite.frame = 1
		stance_cooldown = true
		Pointer.enabled = false
		Pointer.visible = false
	else:
		Sprite.frame = 0
		Pointer.enabled = true
		Pointer.visible = true
		

func _process(delta):
	if is_button_pressed(by_input):
		if stance_cooldown == true:
			timer.start()
		else:
			print("stance swapped")
			stanceSwap()


#With this timer we should get short cooldown with swapping stances hopefully a fixt to it spamming stances
func _on_timer_timeout():
	stance_cooldown = false


func _on_start_up_timeout():
	stanceSwap()


func _on_hud_timeout():
	Sprite.visible = false
