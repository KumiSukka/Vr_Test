extends XRToolsHand

@export var ax_input = "ax_button"
@onready var _leftPickUp =  $LeftHand/XRToolsFunctionPickup
@onready var _leftPointer = $LeftHand/FunctionPointer
@onready var _rightPointer = $RightHand/FunctionPointer
@onready var _rightPickUp = $RightHand/XRToolsFunctionPickup


# Left controller node
var _controller_left_node : XRController3D

# Right controller node
var _controller_right_node : XRController3D

func _ready():
	_controller_left_node = XRHelpers.get_left_controller(self)
	_controller_right_node = XRHelpers.get_right_controller(self)
		
func _process(delta):
	if _controller.is_button_pressed(ax_input): #This seems to work for getting input so progress
		print("ax_pressed")
		#Simppeli if else pickupin päälle ja pois riippuen onko päällä
		stanceSwap()
		
func stanceSwap():
	if (_leftPickUp.enabled == true):
			_leftPickUp.enabled = false
			_rightPickUp.enabled = false
			print("PickUp disabled")
	else:
			_leftPickUp.enabled = true
			_rightPickUp.enabled = true
			print("PickUp enabled")
	if (_leftPointer.enabled == true):
		_leftPointer.enabled = false
		_rightPointer.enabled == false
	else:
		_leftPointer.enabled = true
		_rightPointer.enabled == true
