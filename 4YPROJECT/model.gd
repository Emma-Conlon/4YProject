extends MeshInstance

var file = File.new()
var result2 = {}
onready var modeling=get_node(".")
var colleted
var minimap_icon="emerald"
var dead

func _ready():
	Load()
	dead = false

func _on_Area_body_entered(body):
	if body.name == "Player":
			$Chime.play()
			GameManager.redEmerladsCollected+=1
			colleted = GameManager.redEmerladsCollected
			GameManager.dead=true
			Save.gem_dead(self)
			print(Save.save_data["gem_gone"])
			add_to_group("red_dead")
			save()
			yield($Chime, "finished")
			hide()
			
			print("Emeralds Collected",colleted)

		
				
func save():
	if Save.loadpos == 1 and file.file_exists(Save.path_one):
		file.open(Save.path_one,File.WRITE)
		Save.gem_count(colleted)
		file.store_var(Save.save_data)
		file.close()
	if Save.loadpos == 2 and file.file_exists(Save.path_two):
		file.open(Save.path_two,File.WRITE)
		Save.gem_count(colleted)
		if dead == true:
			Save.gem_dead(true)
		file.store_var(Save.save_data)
		file.close()
	if Save.loadpos == 3 and file.file_exists(Save.path_three):
		file.open(Save.path_three,File.WRITE)
		Save.gem_count(colleted)
		if dead == true:
			Save.gem_dead(true)
		file.store_var(Save.save_data)
		file.close()
	if Save.loadpos == 4 and file.file_exists(Save.path_four):
		file.open(Save.path_four,File.WRITE)
		Save.gem_count(colleted)
		if dead == true:
			Save.gem_dead(true)
		file.store_var(Save.save_data)
		file.close()

#sees if the object had collided or not
func Load():

	if Save.loadpos == 1 and file.file_exists(Save.path_one):
		file.open(Save.path_one,File.READ)
		result2 = file.get_var()
		for i in result2["gem_gone"]:
			i.hide()
		file.close()
	if Save.loadpos == 2 and file.file_exists(Save.path_two):
		file.open(Save.path_two,File.READ)
		result2 = file.get_var()
		#for i in save_nodes:
		#	queue_free()
		file.close()
	if Save.loadpos == 3 and file.file_exists(Save.path_three):
		file.open(Save.path_three,File.READ)
		result2 = file.get_var()
		#for i in save_nodes:
		#	queue_free()
		file.close()
	if Save.loadpos == 4 and file.file_exists(Save.path_four):
		file.open(Save.path_four,File.READ)
		result2 = file.get_var()
		#for i in save_nodes:
		#	queue_free()
		file.close()
