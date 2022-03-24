extends Spatial

onready var player = $Navigation/Player
onready var enemy = $Navigation/PathFindingAI
var sec
var gf = false


func _ready():
	
	sec = "maze"
	Save.level(sec)
	Save.save_data["level"] = sec



func _on_Timer_timeout():
		get_tree().call_group("PathFindingAI", 'get_target_path', player.global_transform.origin)
	
		
	
	
func _process(delta):
			#GameManager.emerladsMax
	if GameManager.redEmerladsCollected >= 2:
			var sce = "maze"
			Save.won(sce)
			Save.save_data["games_won"] = sec
	for member in get_tree().get_nodes_in_group("PathFindingAI"):
		if member.state == member.STAGE.ATTACK:
			$Gameover.visible = true
			member.state = member.STAGE.IDLE

	
#resets the players and enemys positons 
func _on_Button_pressed():
	print("died")
	for member in get_tree().get_nodes_in_group("PathFindingAI"):
		member.state = member.STAGE.IDLE
	$Gameover.visible = false
	player.global_transform.origin = Vector3(39.652,2.125,-9.85)
	#enemy.global_transform.origin = Vector3(-9.209,0.792,7.449)
