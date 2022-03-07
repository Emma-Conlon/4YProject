extends Spatial

onready var player = $Navigation/Player
onready var enemy = $Navigation/PathFindingAI
var sec

func _ready():
	sec = "maze"
	Save.level(sec)
	Save.save_data["level"] = sec



func _on_Timer_timeout():
	get_tree().call_group("PathFindingAI", 'get_target_path', player.global_transform.origin)
		
func _process(delta):

	if enemy.state == enemy.STAGE.ATTACK:
		$Gameover.visible = true



#resets the players and enemys positons 
func _on_Button_pressed():
	print("died")
	enemy.state = enemy.STAGE.IDLE
	$Gameover.visible = false
	player.global_transform.origin = Vector3(39.652,2.125,-9.85)
	enemy.global_transform.origin = Vector3(-9.209,0.792,7.449)
