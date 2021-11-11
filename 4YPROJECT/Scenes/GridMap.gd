extends GridMap

onready var gb=$Spatial/Sprite3D2/Viewport2/Label
onready var text=$Spatial/Sprite3D/Viewport/Label

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if GameManager.red==0 and GameManager.lighting==1:
		text.visible_characters=0
		gb.visible_characters=0
		
	if GameManager.lighting==0:
		text.visible_characters=0
		gb.visible_characters=0
		
		
	elif GameManager.red==1 and GameManager.lighting==1:
		text.visible_characters=-1
		gb.visible_characters=-1
	pass
