extends XRToolsHand

@export var ax_input = "ax_button"


func _process(delta):
	if _controller.is_button_pressed(ax_input): #This seems to work for getting input so progress
		print("ax_pressed")
