extends MeshInstance

onready var modeling=get_node(".")





func _on_Area_body_entered(body):
	if body.name == "Player":
			queue_free()
			GameManager.redEmerladsCollected+=1
			print("Emeralds Collected",GameManager.redEmerladsCollected)
			
