extends Control

onready var clo=get_node(".")
const Scene2=preload("res://LEVEL.tscn")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().quit()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_StartButton_pressed():
	var _vale = get_tree().change_scene("res://test.tscn");
	 


func _on_Instructions_pressed():
	var _value = get_tree().change_scene("res://Scenes/Instructions.tscn");


func _on_Quit_pressed():
	get_tree().quit();


func _on_Transition_trasntioned():
	var _value = get_tree().change_scene("res://test.tscn");

