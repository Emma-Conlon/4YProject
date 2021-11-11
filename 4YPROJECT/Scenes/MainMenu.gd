extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Buttons/StartButton.grab_focus()

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().quit()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_StartButton_pressed():
	 var _val = get_tree().change_scene("res://Scenes/GridMap.tscn");


func _on_Instructions_pressed():
	var _value = get_tree().change_scene("res://Scenes/Instrictions.tscn");


func _on_Quit_pressed():
	get_tree().quit();
