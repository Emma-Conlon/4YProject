extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Buttons/StartButton.grab_focus()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_StartButton_pressed():
	get_tree().change_scene("res://Scenes/Here.tscn");


func _on_Instructions_pressed():
	get_tree().change_scene("res://Scenes/Instrictions.tscn");


func _on_Quit_pressed():
	get_tree().quit();
