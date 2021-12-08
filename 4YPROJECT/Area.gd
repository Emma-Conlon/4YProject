extends Area


var clicked=false


func _on_Area_body_entered(body):
	if body.name == "Player":
		
		
		queue_free()
		
		


