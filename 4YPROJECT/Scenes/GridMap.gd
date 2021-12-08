extends GridMap

onready var gb=$Spatial/Sprite3D2/Viewport2/Label
onready var text=$Spatial/Sprite3D/Viewport/Label
var hovered=false
onready var life= $Door/TextureRect/Label
onready var torch=$Door



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if GameManager.red==0 and GameManager.lighting==1:
		text.visible_characters=0
		gb.visible_characters=0
	if (Input.is_action_just_pressed("PICKUP"))and GameManager.redEmerladsCollected==1 and hovered:
			GameManager.loading=1
			life.text="Exit_Level"
			#get_tree().change_scene("res://LoadingScreen.tscn");
			GameManager.doorOpen=1
			
	if GameManager.redEmerladsCollected==0:
		life.text="Get All Emeralds"
		
	if GameManager.lighting==0:
		text.visible_characters=0
		gb.visible_characters=0
		
		
	elif GameManager.red==1 and GameManager.lighting==1:
		text.visible_characters=-1
		gb.visible_characters=-1
	pass


func _on_Area_mouse_entered():
	life.show()
	print("GETSOME")
	hovered=true


func _on_Area_mouse_exited():
	life.hide()
	hovered=false


	
