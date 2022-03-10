extends Spatial

onready var voice = $Level/Navigation/Enemy1
onready var box1 = $Level/Navigation/walk/box
onready var box = $Level/Navigation/walk/Position3D
onready var d = $Level/Navigation/Enemy1
onready var f = $Level/Navigation/NavigationMeshInstance/GridMap/Player
func _on_Timer_timeout():
	pass
	get_tree().call_group("HideandSeek", 'get_target_path', box1.global_transform.origin)
	


func _on_MeshInstance_body_entered(body):
	if body.name == "Enemy1":
		d.walking(box1,box)
