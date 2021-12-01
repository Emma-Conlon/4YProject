extends CanvasLayer

signal trasntioned 

func _ready():
	pass
	
	
	
func trasntion():
	$AnimationPlayer.play("fade_to_black")


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "fade_to_black":
		print("singal transmitted")
		emit_signal("trasntioned")
		$AnimationPlayer.play("fade_to_normal")
		if anim_name == "fade_to_normal":
			print("transion done")
