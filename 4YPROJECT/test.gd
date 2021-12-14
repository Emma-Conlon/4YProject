extends Spatial

onready var player = $Player
onready var greyRock = $dull/progress
onready var doneOne=$Game1Done


func _on_Timer_timeout():
	get_tree().call_group("PathFindingAI", 'get_target_path', player.global_transform.origin)


func _process(_delta):	
	if GameManager.completedGame0ne==true and $dull/progress.visible==true:
		$dull/progress.hide()
		doneOne.show()

	
