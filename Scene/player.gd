extends XROrigin3D

@onready var leftHand = $LeftHand
@onready var rightHand = $RightHand


func _on_disable_flight_area_entered(area):
	leftHand.disable_flight()
	rightHand.disable_flight()

func _on_disable_flight_area_exited(area):
	leftHand.enable_flight()
	rightHand.enable_flight()
