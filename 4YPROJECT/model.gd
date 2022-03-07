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

func _input(event):
		if event.is_action_pressed("save"):
			if dead == false:
				return
			elif dead == true:
				save()
				print(Save.save_data["gem_x"])
				
func _on_Area_body_entered(body):
	if body.name == "Player" and visible == true:
			$Chime.play()
			GameManager.redEmerladsCollected+=1
			colleted = GameManager.redEmerladsCollected
			GameManager.dead=true
			dead=true
			Save.gem_position(global_transform.origin.x,global_transform.origin.y,global_transform.origin.z)
			Save.gem_count(colleted)
			yield($Chime, "finished")
			visible = false
			hide()
			
			print("Emeralds Collected",colleted)

		
				
func save():
	if Save.loadpos == 1 and file.file_exists(Save.path_one):
		file.open(Save.path_one,File.WRITE)
		file.store_var(Save.save_data)
		file.close()
	if Save.loadpos == 2 and file.file_exists(Save.path_two):
		file.open(Save.path_two,File.WRITE)
		file.store_var(Save.save_data)
		file.close()
	if Save.loadpos == 3 and file.file_exists(Save.path_three):
		file.open(Save.path_three,File.WRITE)
		file.store_var(Save.save_data)
		file.close()
	if Save.loadpos == 4 and file.file_exists(Save.path_four):
		file.open(Save.path_four,File.WRITE)
		file.store_var(Save.save_data)
		file.close()

#sees if the object had collided or not
func Load():
	
	if Save.loadpos == 1 and file.file_exists(Save.path_one):
		file.open(Save.path_one,File.READ)
		result2 = file.get_var()
		for i in result2["gem_x"]:
			for k in result2["gem_y"]:
				for z in result2["gem_z"]:
					var pos = Vector3(i,k,z)
					if global_transform.origin == pos :
						visible = false
		
		file.close()
	if Save.loadpos == 2 and file.file_exists(Save.path_two):
		file.open(Save.path_two,File.READ)
		result2 = file.get_var()
		for i in result2["gem_x"]:
			for k in result2["gem_y"]:
				for z in result2["gem_z"]:
					var pos = Vector3(i,k,z)
					if global_transform.origin == pos :
						visible = false
		file.close()
	if Save.loadpos == 3 and file.file_exists(Save.path_three):
		file.open(Save.path_three,File.READ)
		result2 = file.get_var()
		for i in result2["gem_x"]:
			for k in result2["gem_y"]:
				for z in result2["gem_z"]:
					var pos = Vector3(i,k,z)
					if global_transform.origin == pos :
						visible = false
		file.close()
	if Save.loadpos == 4 and file.file_exists(Save.path_four):
		file.open(Save.path_four,File.READ)
		result2 = file.get_var()
		for i in result2["gem_x"]:
			for k in result2["gem_y"]:
				for z in result2["gem_z"]:
					var pos = Vector3(i,k,z)
					if global_transform.origin == pos :
						visible = false
		file.close()
