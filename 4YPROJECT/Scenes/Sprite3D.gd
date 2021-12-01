extends Sprite3D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


onready var text=get_node(".")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if GameManager.red==0:
		text.visible=false
		
	elif GameManager.red==1:
		text.visible=false
	pass


