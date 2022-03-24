extends Control

onready var hideandseek=$Panel/Label
onready var hideandseek2=$Panel/Label2
onready var hideandseek3=$Panel/Label3
onready var time=$Timer
var text=0.0
var num=0.0
var num1=0.0
var twoDone=false
var oneDone=false
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	
	hideandseek.percent_visible = text
	text+=0.005
	
	if hideandseek.percent_visible>=1 and Input.is_action_just_pressed("enter"):#done :D 
		hideandseek.visible=false
		oneDone=true
	
	elif text<=1:
		time.start()
	
	if oneDone==true:

		hideandseek2.percent_visible = num
		num+=0.003
	
	if hideandseek2.percent_visible>=1 and Input.is_action_just_pressed("enter"):
		oneDone=false
		hideandseek2.visible=false
		twoDone=true
		
	if twoDone==true:
		
		hideandseek3.percent_visible = num1
		num1+=0.002
		
	if hideandseek2.visible==false and hideandseek.visible==false and hideandseek3.percent_visible>=1 and Input.is_action_just_pressed("enter"):
		get_tree().change_scene("res://Scenes/Maze.tscn")

func _on_Timer_timeout():
	pass
	
