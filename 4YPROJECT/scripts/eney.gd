extends Spatial

onready var pos1 = $Level/first_floor_pos/Position3D
onready var pos2 = $Level/first_floor_pos/Position3D2
onready var pos3 = $Level/first_floor_pos/Position3D3
onready var pos4 = $Level/first_floor_pos/Position3D4
onready var pos5 = $Level/first_floor_pos/Position3D5
onready var pos6 = $Level/first_floor_pos/Position3D6
onready var pos7 = $Level/first_floor_pos/Position3D7
onready var pos8 =$Level/first_floor_pos/Position3D8
onready var pos9 = $Level/first_floor_pos/Position3D9
onready var pos10 = $Level/first_floor_pos/Position3D10
onready var pos11 = $Level/first_floor_pos/Position3D11
onready var pos12 = $Level/first_floor_pos/Position3D12
onready var pos13 = $Level/first_floor_pos/Position3D13
onready var pos14 = $Level/first_floor_pos/Position3D14
onready var pos15 = $Level/first_floor_pos/Position3D15
onready var pos16 = $Level/first_floor_pos/Position3D16
onready var pos17 = $Level/first_floor_pos/Position3D17
onready var pos18 = $Level/first_floor_pos/Position3D18
onready var pos19 = $Level/first_floor_pos/Position3D19
onready var pos20 = $Level/first_floor_pos/Position3D20
onready var pos21 = $Level/first_floor_pos/Position3D21
onready var pos22 = $Level/first_floor_pos/Position3D22
onready var pos23 = $Level/first_floor_pos/Position3D23
onready var pos24 = $Level/first_floor_pos/Position3D24
onready var pos25 = $Level/first_floor_pos/Position3D25
onready var pos26 = $Level/first_floor_pos/Position3D26
onready var pos27 = $Level/first_floor_pos/Position3D27
onready var pos28 =$Level/first_floor_pos/Position3D28
onready var pos29 = $Level/first_floor_pos/Position3D29
onready var pos30 = $Level/first_floor_pos/Position3D30
onready var pos31 = $Level/first_floor_pos/Position3D31
onready var pos32 = $Level/first_floor_pos/Position3D32
onready var pos33 = $Level/first_floor_pos/Position3D33
onready var player = $Navigation/NavigationMeshInstance/GridMap/Player
var hit = false
var collided = false
var collided2 = false
var floor_pos
var floor_pos2
var c
var sec
var random_pos = 1


func _on_Timer_timeout():
	if hit == false:
		for member in get_tree().get_nodes_in_group("first_floor_enemy"):
			first_floor()
			member.get_target_path(floor_pos)
			print(random_pos,floor_pos)

#
#			member.get_target_path(floor_pos)
		

func _ready():
		_on_Timer_timeout()
		print(random_pos)
	


func first_floor():
	randomize()
	random_pos = randi() % 33 + 1
	
	#add a random varible and check t osee if the neemy pos is equal to one of these pos if so randize again
	if random_pos == 1:
		floor_pos = pos1.global_transform.origin
		hit = true
	if random_pos == 2:
		floor_pos = pos2.global_transform.origin
		hit = true
	if random_pos == 3:
		floor_pos = pos2.global_transform.origin
		hit = true
	if random_pos == 4:
		floor_pos = pos4.global_transform.origin
		hit = true
	if random_pos == 5:
		floor_pos = pos5.global_transform.origin
		hit = true
	if random_pos == 6:
		floor_pos = pos6.global_transform.origin
		hit = true
	if random_pos == 7:
		floor_pos = pos7.global_transform.origin
		hit = true
	if random_pos == 8:
		floor_pos = pos8.global_transform.origin
		hit = true
	if random_pos == 9:
		floor_pos = pos9.global_transform.origin
		hit = true	
	if random_pos == 10:
		floor_pos = pos10.global_transform.origin
		hit = true	


	if random_pos == 10:
		floor_pos = pos10.global_transform.origin
		hit = true
	if random_pos == 11:
		floor_pos = pos11.global_transform.origin
		hit = true	
	if random_pos == 12:
		floor_pos = pos12.global_transform.origin
		hit = true	
	if random_pos == 13:
		floor_pos = pos14.global_transform.origin
		hit = true	
	if random_pos == 15:
		floor_pos = pos15.global_transform.origin
		hit = true	
	if random_pos == 16:
		floor_pos = pos16.global_transform.origin
		hit = true	
	if random_pos == 17:
		floor_pos = pos17.global_transform.origin
		hit = true	
	if random_pos == 18:
		floor_pos = pos18.global_transform.origin
		hit = true	
	if random_pos == 19:
		floor_pos = pos19.global_transform.origin
		hit = true	
	if random_pos == 20:
		floor_pos = pos20.global_transform.origin
		hit = true	
	if random_pos == 21:
		floor_pos = pos21.global_transform.origin
		hit = true	
	if random_pos == 22:
		floor_pos = pos22.global_transform.origin
		hit = true	
	if random_pos == 23:
		floor_pos = pos23.global_transform.origin
		hit = true	
	if random_pos == 24:
		floor_pos = pos24.global_transform.origin
		hit = true
	if random_pos == 25:
		floor_pos = pos25.global_transform.origin
		hit = true
	if random_pos == 26:
		floor_pos = pos26.global_transform.origin
		hit = true
	if random_pos == 27:
		floor_pos = pos27.global_transform.origin
		hit = true
	if random_pos == 28:
		floor_pos = pos28.global_transform.origin
		hit = true
	if random_pos == 29:
		floor_pos = pos29.global_transform.origin
		hit = true
	if random_pos == 30:
		floor_pos = pos30.global_transform.origin
		hit = true
	if random_pos == 31:
		floor_pos = pos31.global_transform.origin
		hit = true
	if random_pos == 32:
		floor_pos = pos32.global_transform.origin
		hit = true
	if random_pos == 33:
		floor_pos = pos33.global_transform.origin
		
		hit = true

func _process(delta):
	if GameManager.greenEmerladsCollected >= 25:
			GameManager.completedGame0ne = true
			GameManager.completedGameTwo = true
			var sce = "hide&seek"
			Save.won(sce)
			var _R= get_tree().change_scene("res://test.tscn")
			Save.save_data["games_won"] = sec
			print("HIDE AAND SEEK WON")
func _on_Area_body_entered(body):
	if body.is_in_group("first_floor_enemy"):
		first_floor()
		body.get_target_path(floor_pos)
		#hit=true


func _on_Button_pressed():
	print("died")
	$Gameover.visible = false
	player.global_transform.origin = Vector3(39.652,2.125,-9.85)
