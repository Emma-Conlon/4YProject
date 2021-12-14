extends MeshInstance

onready var modeling=get_node(".")

var minimap_icon="emerald"

func _on_Area_body_entered(body):
	if body.name == "Player":
			$Chime.play()
			GameManager.redEmerladsCollected+=1
			GameManager.dead=true
			yield($Chime, "finished")
			queue_free()
			
			print("Emeralds Collected",GameManager.redEmerladsCollected)
			
				
			


