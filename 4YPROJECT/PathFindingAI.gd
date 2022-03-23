extends KinematicBody
enum STAGE{
	IDLE,
	ATTACK
}

var state = STAGE.IDLE
export var speed = 5
var target=null
var path = []
var cur_path_idx = 0
var velocity = Vector3.ZERO
var threshold = .5
var collided
onready var nav = get_parent()


		
func _physics_process(_delta):
	if state==STAGE.ATTACK: 
		var material = SpatialMaterial.new()
		material.albedo_color = Color(1, 0, 0)#Red
		$MeshInstance.set_surface_material(0, material)
	if state==STAGE.IDLE: 
		var material = SpatialMaterial.new()
		material.albedo_color = Color(0, 0, 1)#Red
		$MeshInstance.set_surface_material(0, material)
		
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


func _on_HIT_body_entered(body):
	if body.name=="Player":
		state = STAGE.ATTACK
