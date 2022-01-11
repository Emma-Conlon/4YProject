extends Control

onready var Target_XZ = get_parent().get_node("Navigation/Player")
onready var Target_Y = get_parent().get_node("Navigation")
onready var Target_X= get_parent().get_node("Collectables")

onready var cam = get_node("MapContainer/MapViewport/Camera")
onready var cam2 = get_node("MapContainer/MapViewport/Camera2")
# warning-ignore:unused_argument
func _physics_process(delta): #for player and pci
	cam.translation.x = Target_XZ.get_global_transform().origin.x
	cam.translation.z = Target_XZ.get_global_transform().origin.z
	cam.translation.y = Target_Y.get_global_transform().origin.y + 40.0
	
	if GameManager.dead==false:
		cam2.translation.x = Target_X.get_global_transform().origin.x
		cam2.translation.z = Target_X.get_global_transform().origin.z
		cam2.translation.y = Target_Y.get_global_transform().origin.y + 40.0
			
	
