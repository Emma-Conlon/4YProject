extends Node

func _ready():
	if GameManager.clicked==true:
		queue_free()
