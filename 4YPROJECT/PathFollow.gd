extends PathFollow
 
export var runSpeed = 1



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if GameManager.love == GameManager.PATROL:
		set_offset(get_offset() + runSpeed * delta)
		if(loop == false and get_unit_offset() == 1):
			queue_free()


func _on_Timer_timeout():
	GameManager.love=GameManager.IDLE
