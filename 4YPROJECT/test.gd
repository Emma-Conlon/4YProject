extends Spatial

onready var player = $Player
onready var greyRock = $dull/progress
onready var doneOne=$Game1Done
var section

func _on_Timer_timeout():
	get_tree().call_group("PathFindingAI", 'get_target_path', player.global_transform.origin)


func _process(_delta):	
	
	if GameManager.completedGame0ne==true and $dull/progress.visible==true:
		$dull/progress.hide()
		doneOne.show()

	
func _ready():
	_get_save()
	
func _get_save():
	section = "main_hall"
	Save.level(section)
	Save.save_data["level"] = "main_hall"
	print(Save.save_data["level"])
	return Save.save_data
