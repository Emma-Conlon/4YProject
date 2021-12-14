extends GridMap

var hovered=false
onready var life= $Door/TextureRect/Label
onready var torch=$Door



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):

		
	if (Input.is_action_just_pressed("PICKUP"))and GameManager.redEmerladsCollected==1 and hovered:
			GameManager.loading=1
			life.text="Exit_Level"
			#get_tree().change_scene("res://LoadingScreen.tscn");
			GameManager.doorOpen=1
			
	if GameManager.redEmerladsCollected==0:
		life.text="Get All Emeralds"
		

		
		
	


func _on_Area_mouse_entered():
	life.show()
	print("GETSOME")
	hovered=true


func _on_Area_mouse_exited():
	life.hide()
	hovered=false


	
