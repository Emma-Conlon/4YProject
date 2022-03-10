extends KinematicBody


enum {
	IDLE,
	PATROL,
	CHASE,
	ATTACK

}

var rng = RandomNumberGenerator.new()
var state = GameManager.PATROL
var time: float
var tim:float
var minTime=5
var maxTime=10
var count = 0
var start = true
var patrolMax=21
var hi=false;
export var speed = 5
var target=null
var path = []
var cur_path_idx = 0
var velocity = Vector3.ZERO
var threshold = .5
var box
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

		move_and_slide(velocity, Vector3.UP)
		
func get_target_path(target_pos):
	path = nav.get_simple_path(global_transform.origin, target_pos)
	

func pat():
	if 	GameManager.love==GameManager.PATROL: 
		
	
		GameManager.love=GameManager.IDLE
	#state=PATROL
	

	#enter()


func _on_ATTACK_body_entered(body):
	if body.name=="Enemy1":
		state = ATTACK
	
	#elif #condition 3:
		#state = CHASE
	#elif #condition 3:
		#state = ATTACK


func _on_ATTACK_body_exited(body):
	if body.name=="Player":
		#state = IDLE
		pass
		
func _on_Area_body_entered(body):
	if body.name=="Player":
		state = CHASE
	else: #condition 2:
		#state = IDLE
	#elif #condition 3:
		#state = CHASE
	#elif #condition 3:
		#state = ATTACK
		pass
	
func _on_Area_body_exited(body):
	if body.name=="Player":
		#state = IDLE
		pass
	
		
func _process(_delta):
	var material = SpatialMaterial.new()
	if 	state==GameManager.IDLE: 
		material.albedo_color = Color(0, 0, 1)#Blue
	if GameManager.love==GameManager.PATROL:
		
		material.albedo_color = Color(1, 0, 1)#Blue
	if state==CHASE: 
	
		material.albedo_color = Color(0, 1, 0)#GREEN
	if state==ATTACK: 
		
		material.albedo_color = Color(1, 0, 0)#Red

	
	$MeshInstance.set_surface_material(0, material)
	
	

func walking(target_pos,rf):
	if start:
		count+=1
	if !start:
		count -=1
	target_pos.global_transform.origin = rf.global_transform.origin
	if count == 0:
		start = true
		rf.global_transform.origin = Vector3(8.577,0,-9.17)
	if count == 1:
		rf.global_transform.origin = Vector3(8.391,0,-20.742)
	elif count == 2:
		rf.global_transform.origin = Vector3(8.391,0,-42.027)
	elif count == 3:
		rf.global_transform.origin = Vector3(2.09,0,-43.658)
	elif count == 4:
		rf.global_transform.origin = Vector3(2.09,0,-38.994)
	elif count == 5:
		rf.global_transform.origin = Vector3(-7.577,0,-38.994)
	elif count == 6:
		rf.global_transform.origin = Vector3(-7.577,0,-46.816)
	elif count == 7:
		rf.global_transform.origin = Vector3(2.09,0,-46.816)
	elif count == 8:
		start = false
		rf.global_transform.origin = Vector3(16.012,0,-43.622)
