extends Node


var save_dictionary = {}# this is to save the game ^^

func save_all():
	pass
	

func save_level():
	pass
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func save_red_emeralds(red_emerald):
	save_dictionary["red_emeralds"] = red_emerald.collected
