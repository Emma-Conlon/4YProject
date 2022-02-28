extends Control

onready var clo = get_node(".")
# ------------------------------------------------------------------------------
func toggle() -> void:
	self.visible = not get_tree().paused
	get_tree().paused = self.visible


# ------------------------------------------------------------------------------
func _input(event):
	if event.is_action_pressed("paused"):
		print("paused game")
		toggle()


# ------------------------------------------------------------------------------
func _on_Exit_pressed():
	get_tree().paused = false
	var _value = get_tree().change_scene("res://Scenes/MainMenu.tscn");


# ------------------------------------------------------------------------------
func _on_Settings_pressed():
	pass # Replace with function body.


func _on_Resume_pressed():
	get_tree().paused = false
	hide()


func _on_Save_pressed():
	pass # Replace with function body.

