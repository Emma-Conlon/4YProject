extends Spatial

var hovered=false
onready var fozz= $flashlight/TextureRect/Label
onready var torch=$flashlight

func ready():
	connect("mouse_entered", self, "_on_mouse_entered")
	connect("mouse_exited", self, "_on_mouse_exited")

func _on_Area_mouse_entered():
	fozz.show()
	print("idk")
	hovered=true
	
	


func _on_Area_mouse_exited():
	 fozz.hide()
	 hovered=false
	 

func _process(_delta):
	if (Input.is_action_just_pressed("PICKUP"))and hovered:
		GameManager.pickup=1
		print("picked_up")
		torch.hide()
		
		

