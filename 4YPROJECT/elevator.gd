extends Spatial
enum DOORS{
	OPEN,
	CLOSE,
	G,
	ONE,
	TWO,
	UP,
	UP2,
	DOWN,
	DOWN2
}
var flooranim=DOORS.G
var movinganim=null
var dooranim=null
onready var first_floor =$Lift/Ist_Floor/Sprite3D/TextureRect/Label
var selectOne=false
var onesel=false
var selectTWO=false
var selectG=false
var animationplaying=false;
var upSelected=false
var downSelected=false
var upsel=true
var played=false
onready var G_floor=$Lift/G_Floor/TextureRect/Label
onready var Sec_floor=$Lift/nd_Floor/TextureRect/Label
onready var upButton=$elevatorButton/UP/TextureRect/Label

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("Doors_Open").connect("animation_finished",self,"on_anim_finished")
	get_node("GoingUp").connect("animation_finished",self,"up_or_down")


	
func up_or_down():
	if flooranim==DOORS.G:
		$Lift/elevatorButton/DOWN.visible=false
		$Lift/elevatorButton/UP.visible=true
	#stuff for first floor only 
	if flooranim==DOORS.ONE:
		$Lift/elevatorButton/DOWN.visible=true
		$Lift/elevatorButton/UP.visible=true
	if flooranim==DOORS.TWO:
		$Lift/elevatorButton/DOWN.visible=true		
		$Lift/elevatorButton/UP.visible=false
	#stuff for first floor only 
	
#checks to see if doors open is done :D 
func on_anim_finished():
	
#	if dooranim==DOORS.OPEN and onesel==true:
#			get_node("Doors_Open").play_backwards("Doors_Open")
#
#	#to get it to go from G to 1 
	if flooranim==DOORS.ONE and movinganim==DOORS.UP:#from G to 1
		get_node("Doors_Open").play("moving")
		movinganim=null
	if flooranim==DOORS.ONE and movinganim==DOORS.DOWN:#from 2 to 1
		get_node("Doors_Open").play_backwards("middleMove")
		movinganim=null
	if flooranim==DOORS.G and movinganim==DOORS.DOWN:#from 1 to G
		get_node("Doors_Open").play_backwards("moving")
		movinganim=null
	if flooranim==DOORS.TWO and movinganim==DOORS.UP:#from 1 to 2
		get_node("Doors_Open").play("middleMove")
		movinganim=null
	if flooranim==DOORS.G and movinganim==DOORS.DOWN2:#from 2nd to G
		get_node("Doors_Open").play_backwards("movingup2")
		movinganim=null
	if flooranim==DOORS.TWO and movinganim==DOORS.UP2:#from G to 2
		get_node("Doors_Open").play("movingup2")
		movinganim=null
	if dooranim==DOORS.CLOSE and upSelected and upsel:
			get_node("Doors_Open").play("Doors_Open")
			dooranim=DOORS.OPEN
			upsel=false
	if dooranim==DOORS.CLOSE and downSelected:
			get_node("Doors_Open").play("Doors_Open")
			dooranim=DOORS.OPEN
			upsel=true
#
func _process(delta):
	on_anim_finished()
	up_or_down()
	
	#FIRST FLOOR--------------------------------------------------------------	
	if (Input.is_action_just_pressed("CLICK"))and selectOne==true:
		#check to see if you are on that floor
		
		if flooranim==DOORS.G:#form g to 1
			flooranim=DOORS.ONE
			movinganim=DOORS.UP
		elif flooranim==DOORS.TWO:#from 2 to 1
			flooranim=DOORS.ONE
			movinganim=DOORS.DOWN
		
		onesel=true
		if  flooranim==DOORS.ONE and selectOne:
			first_floor.text="ALREADY ON FIRST FLOOR"
			$Lift/FloorNumber/Viewport/Label.text="1"
		if  flooranim!=DOORS.ONE and selectOne:
			first_floor.text="First Floor"
		#--------------------------------------
		$Lift/FloorNumber/Viewport/Label.text="1"
		#2ND FLOOR-------------------------------------------------------------
	if (Input.is_action_just_pressed("CLICK"))and selectTWO==true:
		#$Doors_Open.play_backwards("Doors_Open")
		if  flooranim==DOORS.TWO and selectTWO:
			$Lift/FloorNumber/Viewport/Label.text="2"
			Sec_floor.text="ALREADY ON SECOND FLOOR"
		if  flooranim!=DOORS.TWO and selectTWO:
			Sec_floor.text="SECOND Floor"
		$Lift/FloorNumber/Viewport/Label.text="2"
		if flooranim==DOORS.G:# on ground floor and press 2 button 
			flooranim=DOORS.TWO
			movinganim=DOORS.UP2
		elif flooranim==DOORS.ONE:#if on 1s floor and want to go up 
			flooranim=DOORS.TWO
			movinganim=DOORS.UP
	#GROUND FLOOR--------------------------------------------------
	if (Input.is_action_just_pressed("CLICK"))and selectG==true:
		#$Doors_Open.play_backwards("Doors_Open")
		if  flooranim==DOORS.G and selectG:
			$Lift/FloorNumber/Viewport/Label.text="G"
			G_floor.text="ALREADY ON G FLOOR"
		if  flooranim!=DOORS.G and selectG:
			$Lift/FloorNumber/Viewport/Label.text="G"
			G_floor.text="Ground Floor"
		if flooranim==DOORS.ONE:#if on 1st floor and want to go to g
			flooranim=DOORS.G
			movinganim=DOORS.DOWN
			
		if flooranim==DOORS.TWO:#if on second floor and want to go to G 
			flooranim=DOORS.G
			movinganim=DOORS.DOWN2
	#UP BUTTON
	if (Input.is_action_just_pressed("CLICK"))and upSelected==true:
			dooranim=DOORS.CLOSE
			
	if (Input.is_action_just_pressed("CLICK"))and downSelected==true:
			dooranim=DOORS.CLOSE
		
	

func _on_Area_mouse_entered_first_floor():
	first_floor.show()
	selectOne=true
	


func _on_Area_mouse_exited_first_floor():
	first_floor.hide()
	selectOne=false


func _on_Area_mouse_entered_G_floor():
	G_floor.show()
	selectG=true


func _on_Area_mouse_exited_G_floor():
	G_floor.hide()
	selectG=false


func _on_Area_mouse_entered_Second_Floor():
	Sec_floor.show()
	selectTWO=true


func _on_Area_mouse_exited_Second_Floor():
	Sec_floor.hide()
	selectTWO=false



func _on_Area_mouse_entered_Up_Button():
	upSelected=true


func _on_Area_mouse_exited_Up_Button():
	upSelected=false





func _on_Doors_Open_animation_finished(anim_name):
	anim_name="Doors_Open"
	played=true


func _on_Area_body_entered(body):
	upSelected=false
	if body.name == "Player":
		if dooranim==DOORS.OPEN:
			get_node("Doors_Open").play_backwards("Doors_Open")
		if dooranim==DOORS.CLOSE and movinganim==null:
			get_node("Doors_Open").play("Doors_Open")
				
			


func _on_Area_body_exited(body):
	if body.name == "Player":
			get_node("Doors_Open").play_backwards("Doors_Open")
		
				


func _on_Area_mouse_entered_Down():
	downSelected=true


func _on_Area_mouse_exited_Down():
	downSelected=false
