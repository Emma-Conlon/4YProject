extends Spatial

var cool = false
onready var vent_system = $StaticBody/CollisionShape
onready var text = $Sprite3D/TextureRect/Label

func _process(_delta):
	
	if Input.is_action_pressed("CLICK") and cool == true:
		vent_system.disabled=true
	elif cool == false:
		vent_system.disabled=false
	
func _on_Area_body_entered(body):
	if body.name=="Player":
		text.show()
		cool = true


func _on_Area_body_exited(body):
	if body.name=="Player":
		text.hide()
		cool = false
