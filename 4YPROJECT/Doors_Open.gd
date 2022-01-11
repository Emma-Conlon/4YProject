extends AnimationPlayer
signal animation_finish

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
 

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

	emit_signal("animation_finish","Doors_Open")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
