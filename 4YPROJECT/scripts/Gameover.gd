extends Control


onready var talk = $talk
var ra

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	randomize()
	#get_tree().paused
	ra = randi() % 6
	text()


func text():
	print(ra)
	if ra == 0:
		talk.text = "I TOLD YOU TO RUN"
	elif ra ==1:
		talk.text = "IF I KNEW YOU WANTED TO DIE" +"\n"+"I WOULD HAVE JUST KEPT QUIET"
	elif ra ==2:
		talk.text = "THE POINT IS TO GET THE GEMS"
	elif ra == 3:
		talk.text = "UGH..BRING IN THE NEXT ONE"
	elif ra >= 4:
		talk.text = "NO WONDER YOU LOST," +"\n"+"YOU CANT EVEN WORK AT TESCO"

func _on_Button_pressed():
	hide()
	


func _on_Button2_pressed():
	var _t = get_tree().change_scene("res://Scenes/MainMenu.tscn")
