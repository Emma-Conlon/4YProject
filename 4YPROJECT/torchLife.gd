extends Spatial

var hovered=false
onready var life= $Battery/TextureRect/Label
onready var torch=$Battery

func ready():
	connect("mouse_entered", self, "_on_mouse_entered")
	connect("mouse_exited", self, "_on_mouse_exited")

func _on_Area_mouse_entered():
	life.show()
	print("GETSOME")
	hovered=true


func _on_Area_mouse_exited():
	 life.hide()
	 hovered=false


func _process(_delta):
	if (Input.is_action_just_pressed("PICKUP"))and hovered:
		GameManager.plus+=20
		print("picked_up_Batteries")
		torch.hide()
		
		
