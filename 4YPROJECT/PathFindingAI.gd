extends KinematicBody

export var speed = 10
var target=null
var path = []
var cur_path_idx = 0
var velocity = Vector3.ZERO
var threshold = .5

onready var nav = get_parent()

func _physics_process(_delta):
	if path.size() > 0:
		move_to_target()
		
func move_to_target():	
	if global_transform.origin.distance_to(path[cur_path_idx]) < threshold:
		path.remove(0)
	else:
		var direction = path[cur_path_idx] - global_transform.origin
		velocity = direction.normalized() * speed
# warning-ignore:return_value_discarded
		move_and_slide(velocity, Vector3.UP)
		
func get_target_path(target_pos):
	path = nav.get_simple_path(global_transform.origin, target_pos)


