extends Spatial

var file = File.new()
var result2 = {}
onready var player = $Player
onready var greyRock = $dull/progress
onready var doneOne=$Game1Done
var section

func _on_Timer_timeout():
	get_tree().call_group("PathFindingAI", 'get_target_path', player.global_transform.origin)


func _process(_delta):	
	if Save.save_data["games_won"] == "maze":
		doneOne.show()
	if Save.save_data["games_won"] == "hide&seek":
		doneOne.show()
		$game2Done.show()
	if GameManager.completedGame0ne==true and $dull/progress.visible==true:
		$dull/progress.hide()
	if GameManager.completedGameTwo==true and $dull2/progress.visible==true:
		$dull2/progress.hide()
		

	
func _ready():
	print(Save.save_data["games_won"])
	save()
	_get_save()
	
func _get_save():
	section = "main_hall"
	Save.level(section)
	Save.save_data["level"] = "main_hall"
	print(Save.save_data["level"])
	return Save.save_data


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
