extends Spatial

onready var player = $Player
onready var AI=$Navigation/PathFindingAI2

func _on_Timer_timeout():
	get_tree().call_group("PathFindingAI", 'get_target_path', player.global_transform.origin)
	
