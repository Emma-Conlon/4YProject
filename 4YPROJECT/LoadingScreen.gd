extends Control

export var MainHall=""
export var entrance=""
var load_time=1
onready var tween=$Tween


func _process(delta):
	pass
	#tween.interpolate_property($ProgressBar,"value",0,100,load_time,tween.TRANS_LINEAR,tween.EASE_OUT)
	
	

#func _on_Tween_tween_all_completed():
	#if MainHall!=null:
			#get_tree().change_scene(MainHall
			
func _on_Timer_timeout():
	if GameManager.life==1:
		$TextureProgress.value+=10
		$ProgressBar.value+=10
	if($TextureProgress.value==100):
			if GameManager.loading==0:
				get_tree().change_scene(MainHall)
			if GameManager.loading==1:
				get_tree().change_scene(entrance)
				GameManager.completedGame0ne=true
	pass # Replace with function body.
