extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var timeer=0

# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	text = "TIME REMAINING: " + str(timeer)

	if timeer == 600 and GameManager.boids < 500:
		$Timer/Gameover.visible=true
	if GameManager.boids == 500:
		GameManager.completedGameThree=true
		var _r = get_tree().change_scene("res://test.tscn")

func _on_Timer_timeout():
	timeer +=1


func _on_Button2_pressed():
	var _r = get_tree().change_scene("res://test.tscn")


func _on_Button_pressed():
	timeer = 0
	var _r = get_tree().change_scene("res://New folder (2)/boids_assets/scenes/main.tscn")
