extends Spatial

onready var pos1 = $Navigation/first_floor_pos/Position3D
onready var pos2 = $Navigation/first_floor_pos/Position3D2
onready var pos3 = $Navigation/first_floor_pos/Position3D3
onready var pos4 = $Navigation/first_floor_pos/Position3D4
onready var pos5 = $Navigation/first_floor_pos/Position3D5
onready var pos6 = $Navigation/first_floor_pos/Position3D6
onready var pos7 = $Navigation/first_floor_pos/Position3D7
onready var pos8 = $Navigation/first_floor_pos/Position3D8
onready var pos9 = $Navigation/first_floor_pos/Position3D9
onready var pos10 = $Navigation/first_floor_pos/Position3D10
onready var pos11 = $Navigation/first_floor_pos/Position3D11
onready var pos12 = $Navigation/first_floor_pos/Position3D12
onready var pos13 = $Navigation/first_floor_pos/Position3D13
onready var pos14 = $Navigation/first_floor_pos/Position3D14
onready var pos15 = $Navigation/first_floor_pos/Position3D15
onready var pos16 = $Navigation/first_floor_pos/Position3D16
onready var pos17 = $Navigation/first_floor_pos/Position3D17
onready var pos18 = $Navigation/first_floor_pos/Position3D18
onready var pos19 = $Navigation/first_floor_pos/Position3D19
onready var pos20 = $Navigation/first_floor_pos/Position3D20
onready var pos21 = $Navigation/first_floor_pos/Position3D21
onready var pos22 = $Navigation/first_floor_pos/Position3D22
onready var pos23 = $Navigation/first_floor_pos/Position3D23
onready var pos24 = $Navigation/first_floor_pos/Position3D24
onready var pos25 = $Navigation/first_floor_pos/Position3D25
onready var pos26 = $Navigation/first_floor_pos/Position3D26
onready var pos27 = $Navigation/first_floor_pos/Position3D27
onready var pos28 = $Navigation/first_floor_pos/Position3D28
onready var pos29 = $Navigation/first_floor_pos/Position3D29
onready var pos30 = $Navigation/first_floor_pos/Position3D30
onready var pos31 = $Navigation/first_floor_pos/Position3D31
onready var pos32 = $Navigation/first_floor_pos/Position3D32
onready var pos33 = $Navigation/first_floor_pos/Position3D33
onready var player = $Navigation/NavigationMeshInstance/GridMap/Player
var first_floor_pos = []

func _on_Timer_timeout():
	get_tree().call_group("first_floor_enemy", 'get_target_path', first_floor_pos)
	get_tree().call_group("PathFindingAI", 'get_target_path', player.global_transform.origin)

	
func _ready():
	first_floor()
	print(first_floor_pos)


func first_floor():
	first_floor_pos.push_back(pos1.global_transform.origin)
	first_floor_pos.push_back(pos2.global_transform.origin) 
	first_floor_pos.push_back(pos3.global_transform.origin)
	first_floor_pos.push_back(pos4.global_transform.origin)
	first_floor_pos.push_back(pos5.global_transform.origin)  
	first_floor_pos.push_back(pos6.global_transform.origin)
	first_floor_pos.push_back(pos7.global_transform.origin) 
	first_floor_pos.push_back(pos8.global_transform.origin)
	first_floor_pos.push_back(pos9.global_transform.origin)
	first_floor_pos.push_back(pos10.global_transform.origin)  
	
	first_floor_pos.push_back(pos11.global_transform.origin)
	first_floor_pos.push_back(pos12.global_transform.origin) 
	first_floor_pos.push_back(pos13.global_transform.origin)
	first_floor_pos.push_back(pos14.global_transform.origin)
	first_floor_pos.push_back(pos15.global_transform.origin)  
	first_floor_pos.push_back(pos16.global_transform.origin)
	first_floor_pos.push_back(pos17.global_transform.origin) 
	first_floor_pos.push_back(pos18.global_transform.origin)
	first_floor_pos.push_back(pos19.global_transform.origin)
	first_floor_pos.push_back(pos20.global_transform.origin)  
	
	first_floor_pos.push_back(pos21.global_transform.origin)
	first_floor_pos.push_back(pos22.global_transform.origin) 
	first_floor_pos.push_back(pos23.global_transform.origin)
	first_floor_pos.push_back(pos24.global_transform.origin)
	first_floor_pos.push_back(pos25.global_transform.origin)  
	first_floor_pos.push_back(pos26.global_transform.origin)
	first_floor_pos.push_back(pos27.global_transform.origin) 
	first_floor_pos.push_back(pos28.global_transform.origin)
	first_floor_pos.push_back(pos29.global_transform.origin)
	first_floor_pos.push_back(pos30.global_transform.origin)
	first_floor_pos.push_back(pos31.global_transform.origin)
	first_floor_pos.push_back(pos32.global_transform.origin)
	first_floor_pos.push_back(pos33.global_transform.origin)  
	
