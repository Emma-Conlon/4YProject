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
var floor_pos

func _on_Timer_timeout():
	get_tree().call_group("first_floor_enemy", 'get_target_path', floor_pos)
	get_tree().call_group("PathFindingAI", 'get_target_path', player.global_transform.origin)

	
func _ready():
	first_floor()
	print(first_floor_pos)


func first_floor():
	#add a random varible and check t osee if the neemy pos is equal to one of these pos if so randize again
	floor_pos = pos1.global_transform.origin
	floor_pos = pos2.global_transform.origin
	floor_pos = pos3.global_transform.origin
	floor_pos = pos4.global_transform.origin
	floor_pos = pos5.global_transform.origin
	floor_pos = pos6.global_transform.origin
	floor_pos = pos7.global_transform.origin
	floor_pos = pos8.global_transform.origin
	floor_pos = pos9.global_transform.origin
	floor_pos = pos10.global_transform.origin 
	
	floor_pos = (pos11.global_transform.origin)
	floor_pos = (pos12.global_transform.origin) 
	floor_pos = (pos13.global_transform.origin)
	floor_pos = (pos14.global_transform.origin)
	floor_pos = (pos15.global_transform.origin)  
	floor_pos = (pos16.global_transform.origin)
	floor_pos = (pos17.global_transform.origin) 
	floor_pos = (pos18.global_transform.origin)
	floor_pos = (pos19.global_transform.origin)
	floor_pos = (pos20.global_transform.origin)  
	
	floor_pos = (pos21.global_transform.origin)
	floor_pos = (pos22.global_transform.origin) 
	floor_pos = (pos23.global_transform.origin)
	floor_pos = (pos24.global_transform.origin)
	floor_pos = (pos25.global_transform.origin)  
	floor_pos = (pos26.global_transform.origin)
	floor_pos = (pos27.global_transform.origin) 
	floor_pos = (pos28.global_transform.origin)
	floor_pos = (pos29.global_transform.origin)
	floor_pos = (pos30.global_transform.origin)
	floor_pos = (pos31.global_transform.origin)
	floor_pos = (pos32.global_transform.origin)
	floor_pos = (pos33.global_transform.origin)  
	
