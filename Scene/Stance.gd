extends XRController3D

@export var ax_input = "ax_button"
var Pointer : Node3D
var PickUp : Node3D
#
#func _ready():
	#Pointer = _find_child(self, "FunctionPointer")
	#PickUp = _find_child(self, "FunctionPickup")
	#
#func _process(delta):
	#if _controller.is_button_pressed(ax_input): #This seems to work for getting input so progress
		#print("ax_pressed")

		
#func stanceSwap():
	#if (_leftPickUp.enabled == true):
			#_leftPickUp.enabled = false
			#_rightPickUp.enabled = false
			#print("PickUp disabled")
	#else:
			#_leftPickUp.enabled = true
			#_rightPickUp.enabled = true
			#print("PickUp enabled")
	#if (_leftPointer.enabled == true):
		#_leftPointer.enabled = false
		#_rightPointer.enabled == false
	#else:
		#_leftPointer.enabled = true
		#_rightPointer.enabled == true
		
#static func _find_child(node : Node, type : String) -> Node:
	## Iterate through all children
	#for child in node.get_children():
		## If the child is a match then return it
		#if child.is_class(type):
			#return child
#
		## Recurse into child
		#var found := _find_child(child, type)
		#if found:
			#return found
#
	## No child found matching type
	#return null
