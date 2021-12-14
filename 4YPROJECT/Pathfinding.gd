extends Area

func _on_Area_body_entered(body):
	if body.name == "Player":
			body.queue_free()
			print("PlayerDead")
			
