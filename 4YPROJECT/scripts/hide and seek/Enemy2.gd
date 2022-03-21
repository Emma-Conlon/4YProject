extends KinematicBody

var move_speed = 3.0

enum STATE {IDLE, WANDER}
var state = STATE.IDLE

onready var start_position = get_global_transform().origin
onready var target_position = get_global_transform().origin
var random_pos

export var speed = 5
var target=null
var path = []
var cur_path_idx = 0
var velocity = Vector3.ZERO
var threshold = .5

onready var nav = get_parent()


func _ready():
	randomize()
	random_pos = randi() % 2
	print(random_pos)
	
func _physics_process(_delta):	
	if $RayCast.is_colliding():
		var obj = $RayCast.get_collider()
		print(obj.get_name())
		if obj.get_name() == "Player":
			print("dead")
		
	if path.size() > 0:
		move_to_target()


func move_to_target():	
	if global_transform.origin.distance_to(path[cur_path_idx]) < threshold:
		path.remove(0)
	else:
		var direction = path[cur_path_idx] - global_transform.origin
		velocity = direction.normalized() * speed

		move_and_slide(velocity, Vector3.UP)


func get_target_path(target_pos):
	path = nav.get_simple_path(global_transform.origin, target_pos)
	
	


