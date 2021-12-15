extends GridMap

var hovered=false
#--------------------GAME 1
onready var life= $Maze_Game/TextureRect/Label
#--------------------GAME 2
onready var seek= $Hide_Seek/TextureRect/Label
#--------------------GAME 3
onready var race= $Race/TextureRect/Label
#--------------------GAME 4
onready var finally= $FinalGame/TextureRect/Label




func ready():
# warning-ignore:return_value_discarded
	connect("mouse_entered", self, "_on_mouse_entered")
# warning-ignore:return_value_discarded
	connect("mouse_exited", self, "_on_mouse_exited")


func _process(_delta):
	if (Input.is_action_just_pressed("CLICK"))and GameManager.doorOne:
		get_tree().change_scene("res://LoadingScreen.tscn");
		
	if (Input.is_action_just_pressed("CLICK"))and GameManager.doorTwo:
		get_tree().change_scene("res://LoadingScreen.tscn");
		
	if (Input.is_action_just_pressed("CLICK"))and GameManager.doorThree:
		get_tree().change_scene("res://LoadingScreen.tscn");
		
	if (Input.is_action_just_pressed("CLICK"))and GameManager.doorFour:
		get_tree().change_scene("res://LoadingScreen.tscn");
		

#Maze-----------------
func _on_Area_mouse_entered_Game1():
	life.show()
	GameManager.doorOne=true
	if GameManager.completedGame0ne==true:
		life.text="Game Completed Want to try again?"

func _on_Area_mouse_exited_Game1():
	life.hide()
	GameManager.doorOne=false
	
#Racing---------------------
func _on_Area_mouse_entered_Game2():
	if GameManager.completedGame0ne==true:
		GameManager.doorTwo=true
		GameManager.doorOne=false
		race.text="Start Race"
		race.show()
	else:
		race.text="LOCKED: Play 1st Game to unlock"
		race.show()
	
	print(GameManager.pickup)
	
	
	
func _on_Area_mouse_exited_Game2():
	race.hide()
	GameManager.doorTwo=false
	
#Hide and Seek------------------------	
func _on_Area_mouse_entered_Game3():
	if GameManager.completedGame0ne==true and GameManager.completedGameTwo==true:
		GameManager.doorThree=true
		seek.text="Start Hide & Seek"
		seek.show()
	else:
		seek.text="LOCKED: Play 1st and 2nd Game to unlock"
		seek.show()
	print(GameManager.pickup)
	


func _on_Area_mouse_exited_Game3():
	seek.hide()
	GameManager.doorThree=false

#FINAL GAME-----------------
func _on_Area_mouse_entered_Game4():
	if GameManager.completedGame0ne==true and GameManager.completedGameTwo==true and GameManager.completedGameThree==true:
		GameManager.doorFour=true
		finally.text=" Begin Final Game"
		finally.show()
	else:
		finally.text="LOCKED: Play all other games to unlock"
		finally.show()
	
	print(GameManager.pickup)
	


func _on_Area_mouse_exitedGame4():
	finally.hide()
	GameManager.doorFour=false
