extends Spatial
enum DOORS{
	OPEN,
	CLOSE,
	G,
	ONE,
	TWO,
	UP,
	DOWN
}
var flooranim=DOORS.G
var movinganim=null
var dooranim=null
onready var first_floor =$Lift/Ist_Floor/TextureRect/Label
var selectOne=false
var onesel=false
var selectTWO=false
var selectG=false
var animationplaying=false;
var upSelected=false
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
	
	#stuff for first floor only 
	pass
#checks to see if doors open is done :D 
func on_anim_finished():
	
#	if dooranim==DOORS.OPEN and onesel==true:
#			get_node("Doors_Open").play_backwards("Doors_Open")
#
#	#to get it to go from G to 1 
	if flooranim==DOORS.ONE and movinganim==DOORS.UP:
		get_node("Doors_Open").play("moving")
		movinganim=null
	if flooranim==DOORS.G and movinganim==DOORS.DOWN:
		get_node("Doors_Open").play_backwards("moving")
		movinganim=null
	if dooranim==DOORS.CLOSE and upSelected and upsel:
			get_node("Doors_Open").play("Doors_Open")
			dooranim=DOORS.OPEN
			upsel=false
#	if dooranim==DOORS.CLOSE and flooranim==DOORS.G and selectOne==true:
#		$GoingUp.play("going_up")
#		dooranim=DOORS.OPEN
#	elif flooranim==DOORS.G and dooranim==DOORS.CLOSE:
#		$Doors_Open.play_backwards("Doors_Open")
#		dooranim=DOORS.OPEN
#
#	elif dooranim==DOORS.CLOSE and flooranim==DOORS.G and upSelected:
#		$Doors_Open.play("Doors_Open")
#		dooranim=DOORS.CLOSE
#		upSelected=false
#	elif dooranim==DOORS.CLOSE and selectOne==true:
#		$Doors_Open.play("Doors_Open")
#		dooranim=DOORS.CLOSE

	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	on_anim_finished()
	up_or_down()
	
	#FIRST FLOOR--------------------------------------------------------------	
	if (Input.is_action_just_pressed("CLICK"))and selectOne==true:
		#check to see if you are on that floor
		
		if flooranim==DOORS.G:
			flooranim=DOORS.ONE
			movinganim=DOORS.UP
		elif flooranim==DOORS.TWO:
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
		
	
			
	
			
		#if dooranim==DOORS.CLOSE and flooranim==DOORS.ONE and selectOne:
		#	$Doors_Open.play("Doors_Open")
		#	dooranim=DOORS.OPEN
		#	selectOne=false
		
		
		#2ND FLOOR-------------------------------------------------------------
	if (Input.is_action_just_pressed("CLICK"))and selectTWO==true:
		#$Doors_Open.play_backwards("Doors_Open")
		if  flooranim==DOORS.TWO and selectTWO:
			$Lift/FloorNumber/Viewport/Label.text="2"
			Sec_floor.text="ALREADY ON SECOND FLOOR"
		if  flooranim!=DOORS.TWO and selectTWO:
			Sec_floor.text="SECOND Floor"
		$Lift/FloorNumber/Viewport/Label.text="2"
	#GROUND FLOOR--------------------------------------------------
	if (Input.is_action_just_pressed("CLICK"))and selectG==true:
		#$Doors_Open.play_backwards("Doors_Open")
		if  flooranim==DOORS.G and selectG:
			$Lift/FloorNumber/Viewport/Label.text="G"
			G_floor.text="ALREADY ON G FLOOR"
		if  flooranim!=DOORS.G and selectG:
			$Lift/FloorNumber/Viewport/Label.text="G"
			G_floor.text="Ground Floor"
		if flooranim==DOORS.ONE:
			flooranim=DOORS.G
			movinganim=DOORS.DOWN
	#UP BUTTON
	if (Input.is_action_just_pressed("CLICK"))and upSelected==true:
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
	if body.name == "Player":
		if dooranim==DOORS.OPEN:
			get_node("Doors_Open").play_backwards("Doors_Open")
		if dooranim==DOORS.CLOSE and movinganim==null:
			get_node("Doors_Open").play("Doors_Open")
				
			


func _on_Area_body_exited(body):
	if body.name == "Player":
			get_node("Doors_Open").play_backwards("Doors_Open")
		
				
