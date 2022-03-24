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
var collided= false
onready var nav = get_parent()
var boo 
const ROTATE_SPEED = 0

func randomizeing(random_pos):
	randomize()
	random_pos = randi() % 33 + 1
	print("here",random_pos)

func _ready():
	var random_color = Color(randf(), randf(), randf())
	var material = SpatialMaterial.new()
	material.albedo_color = Color(random_color)#Red
	$MeshInstance.set_surface_material(0, material)
	
	
func _physics_process(_delta):	
	if $RayCast.is_colliding():
		var obj = $RayCast.get_collider()
#		print(obj.get_name())
		if obj.get_name() == "Player":#fff8b6
			pass
			#$spotLight.set_color("#fc2803")
			
			
	if path.size() > 0:
		move_to_target(_delta)
		
func collision(ty):
	  boo = ty

func move_to_target(_delta):	
	if global_transform.origin.distance_to(path[cur_path_idx]) < threshold:
		
		path.remove(0)
	else:
		var direction = path[cur_path_idx] - global_transform.origin
		velocity = direction.normalized() * speed

		move_and_slide(velocity, Vector3.UP)
		var t = global_transform
		var lp = t.origin + velocity.normalized()
		var lookatpos = lp
		var l = t.looking_at(lookatpos, Vector3(1,1,1))
		var a = Quat(t.basis)
		var b = Quat(l.basis)
		var c = a.slerp(b, ROTATE_SPEED * _delta)
		global_transform.basis = Basis(c)

func get_target_path(target_pos):  
	path = nav.get_simple_path(global_transform.origin, target_pos)
	if self.global_transform.origin == target_pos:
		collided = true
		
	else:
		collided = false
	


