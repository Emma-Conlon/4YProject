extends KinematicBody


enum {
	IDLE,
	PATROL,
	CHASE,
	ATTACK

}
var rng = RandomNumberGenerator.new()
var state = GameManager.IDLE
var time: float
var tim:float
var minTime=5
var maxTime=10
var patorlTime=11
var patrolMax=21
var hi=true;

func enter():
	if 	GameManager.love==GameManager.IDLE:
		
		if hi==true:
				rng.randomize()
				time=round(rng.randf_range(minTime,maxTime))
		$IDLE.set_wait_time(time)		
		$IDLE.start()
		time=time-1
		if time<=0:
				GameManager.love=GameManager.PATROL
		hi=false
		
	elif GameManager.love==GameManager.PATROL:
			
			if hi==false:
				rng.randomize()
				tim=round(rng.randf_range(patorlTime,patrolMax))
			hi=true
			
			$PATROL.set_wait_time(tim)
			tim=tim-1
			if tim<=0:
				GameManager.love=GameManager.IDLE
			$PATROL.start()
			
		#$IDLE.start()
		
		
	
func pat():
	if 	GameManager.love==GameManager.PATROL: 
		
		print("PATROL",tim)
		GameManager.love=GameManager.IDLE
	#state=PATROL
	
func _ready():
	enter()


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
	if 	GameManager.love==GameManager.IDLE: 
		material.albedo_color = Color(0, 0, 1)#Blue
	if GameManager.love==GameManager.PATROL:
		
		material.albedo_color = Color(1, 0, 1)#Blue
	if state==CHASE: 
		print("CHASE")
		material.albedo_color = Color(0, 1, 0)#GREEN
	if state==ATTACK: 
		print("ATTACK")
		material.albedo_color = Color(1, 0, 0)#Red

	
	$MeshInstance.set_surface_material(0, material)
	
	
	
#for IDLE 
func _on_Timer_timeout():

	enter()
#
func check():
	pass


func _on_PATROL_timeout():
	pass
	
