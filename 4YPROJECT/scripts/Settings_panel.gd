extends Control

onready var value_progress = $Panel/ProgressBar

func _on_Back_pressed():
	hide()
	
	

func _on_HSlider_value_changed(value):
	value_progress.value = value
