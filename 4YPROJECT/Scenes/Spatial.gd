extends Spatial

onready var text = $Sprite3D/Viewport/Label


func _shown():
	if GameManager.red==0:
		text.visible_characters=false
	pass
