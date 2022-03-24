extends GridMap

var hovered=false
onready var life= $Door/TextureRect/Label
onready var torch=$Door



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):

		#GameManager.emerladsMax
	if GameManager.redEmerladsCollected >= 2 and hovered==true:
			var sce = "maze"
			GameManager.loading = 1
			life.text="Exit_Level"
			GameManager.completedGame0ne=true
			if Input.is_action_pressed("CLICK"): 
				get_tree().change_scene("res://LoadingScreen.tscn")
				GameManager.doorOpen=1
				
			
	if GameManager.redEmerladsCollected==0:
		life.text="Get All Emeralds"
		

func _on_Area_body_entered(body):
	if body.name == "Player":
			life.show()
			hovered=true



func _on_Area_body_exited(body):
		if body.name == "Player":
			life.hide()
			hovered=false


func _on_Area_mouse_entered():
	life.show()
	hovered=true
