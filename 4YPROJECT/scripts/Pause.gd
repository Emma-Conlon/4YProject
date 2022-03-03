extends Control

# ------------------------------------------------------------------------------
func toggle() -> void:
	var pause_state = not get_tree().paused
	get_tree().paused = pause_state
	visible = pause_state


# ------------------------------------------------------------------------------
func _input(event):
	if event.is_action_pressed("paused"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		print("paused game")
		toggle()


# ------------------------------------------------------------------------------
func _on_Exit_pressed():
	get_tree().paused = false
	var _value = get_tree().change_scene("res://Scenes/MainMenu.tscn");


# ------------------------------------------------------------------------------
func _on_Settings_pressed():
	$Settings.visible = true


func _on_Resume_pressed():
	get_tree().paused = false
	hide()


func _on_Save_pressed():
	pass
