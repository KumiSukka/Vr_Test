extends XROrigin3D

@onready var leftHand = $LeftHand
@onready var rightHand = $RightHand




func _on_wind_area_body_exited(body):
	leftHand.disable_flight()
	rightHand.disable_flight()


func _on_wind_area_body_entered(body):
	leftHand.enable_flight()
	rightHand.enable_flight()
