extends Spatial

onready var player = $Navigation/Player

var sec

func _ready():
	sec = "maze"
	Save.level(sec)
	Save.save_data["level"] = sec


func _on_Timer_timeout():
	get_tree().call_group("PathFindingAI", 'get_target_path', player.global_transform.origin)
	
	
