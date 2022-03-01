extends MeshInstance

onready var modeling=get_node(".")
var colleted
var minimap_icon="emerald"

func _on_Area_body_entered(body):
	if body.name == "Player":
			$Chime.play()
			GameManager.redEmerladsCollected+=1
			colleted = GameManager.redEmerladsCollected
			GameManager.dead=true
			yield($Chime, "finished")
			queue_free()
			
			print("Emeralds Collected",colleted)
			
				
#to save the amount of red emerlads collected			
func accept(vistor):
	vistor.save_red_emeralds(self)

