extends KinematicBody


enum {
	IDLE,
	PATROL,
	ATTACK,

}
var rng = RandomNumberGenerator.new()
var state = GameManager.PATROL
var time: float
var tim:float
var minTime=5
var maxTime=10
var count = 0
var patorlTime=11
var start = true
var patrolMax=21
var hi=false;

func enter():
	if 	state==GameManager.IDLE:
		
		if hi==true:
				rng.randomize()
				time=round(rng.randf_range(minTime,maxTime))
		$IDLE.set_wait_time(time)		
		$IDLE.start()
		print(time,"IDLE")
		time=time-1
		if time<=0:
				GameManager.love=GameManager.PATROL
		hi=false
		
	elif state==GameManager.PATROL:
			if hi==false:
				rng.randomize()
				tim=round(rng.randf_range(patorlTime,patrolMax))
			hi=true
			#$PATROL.set_wait_time(tim)
			tim=tim-1
			$PATROL.start()
			if tim<=0:
				$PATROL.stop()
				state=GameManager.IDLE
			
			print("Patrol",tim)
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
	
	#elif #condition 3:
		#state = CHASE
	#elif #condition 3:
		#state = ATTACK


func _on_ATTACK_body_exited(body):
	if body.name=="Player":
		#state = IDLE
		pass
		
func _on_Area_body_entered(body):
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
	enter()
	


func _on_MeshInstance_body_entered(body):
	if body.name == "Player":
		walking()
		
			
			
func walking():
	if start:
		count+=1
	if !start:
		count -=1
	$walk/box.global_transform.origin = $walk/Position3D.global_transform.origin
	if count == 0:
		start = true
		$walk/Position3D.global_transform.origin = Vector3(0,0,-7.952)
	if count == 1:
		$walk/Position3D.global_transform.origin = Vector3(8.391,0,-20.742)
	elif count == 2:
		$walk/Position3D.global_transform.origin = Vector3(8.391,0,-42.027)
	elif count == 3:
		$walk/Position3D.global_transform.origin = Vector3(2.09,0,-43.658)
	elif count == 4:
		$walk/Position3D.global_transform.origin = Vector3(2.09,0,-38.994)
	elif count == 5:
		$walk/Position3D.global_transform.origin = Vector3(-7.577,0,-38.994)
	elif count == 6:
		$walk/Position3D.global_transform.origin = Vector3(-7.577,0,-46.816)
	elif count == 7:
		$walk/Position3D.global_transform.origin = Vector3(2.09,0,-46.816)
	elif count == 8:
		start = false
		$walk/Position3D.global_transform.origin = Vector3(16.012,0,-43.622)
