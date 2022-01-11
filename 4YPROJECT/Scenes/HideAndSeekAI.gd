extends KinematicBody


enum {
	IDLE,
	PATROL,
	CHASE,
	ATTACK

}

var state = IDLE

func _ready():
	pass


func _on_ATTACK_body_entered(body):
	if body.name=="Player":
		state = ATTACK
	else: #condition 2:
		state = IDLE
	#elif #condition 3:
		#state = CHASE
	#elif #condition 3:
		#state = ATTACK


func _on_ATTACK_body_exited(body):
	if body.name=="Player":
		state = IDLE
		
func _on_Area_body_entered(body):
	if body.name=="Player":
		state = CHASE
	else: #condition 2:
		state = IDLE
	#elif #condition 3:
		#state = CHASE
	#elif #condition 3:
		#state = ATTACK
	
	
func _on_Area_body_exited(body):
	if body.name=="Player":
		state = IDLE
	
		
func _process(_delta):
	var material = SpatialMaterial.new()
	if state==IDLE: 
		print("Idle")
		material.albedo_color = Color(0, 0, 1)#Blue
	if state==CHASE: 
		print("CHASE")
		material.albedo_color = Color(0, 1, 0)#GREEN
	if state==ATTACK: 
		print("ATTACK")
		material.albedo_color = Color(1, 0, 0)#Red

	
	$MeshInstance.set_surface_material(0, material)



		
	
		
			#action 



	
