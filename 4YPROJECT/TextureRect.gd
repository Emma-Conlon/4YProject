extends TextureRect



func ready():
	connect("mouse_entered", self, "_on_mouse_entered")
	connect("mouse_exited", self, "_on_mouse_exited")

func _on_mouse_entered():
	$Label.show()

func _on_mouse_exited():
	$Label.hide()
