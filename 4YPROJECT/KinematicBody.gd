extends KinematicBody

const GRAVITY =  -9.98
var vel = Vector3()
const MAX_SPEED = 20
const JUMP_SPEED = 18
const ACCEL = 4.5
var dir = Vector3()
var red=false
const DEACCEL= 16
const MAX_SLOPE_ANGLE = 20
onready var light = $follow/SpotLight
var camera
var rotation_helper

var MOUSE_SENSITIVITY = 0.05


func _ready():
	get_node("Moving").connect("animation_finished",self,"on_anim_finished")
	camera = $follow/Camera
	rotation_helper = $follow
	Input.set_mouse_mode(Input.MOUSE_MODE_CONFINED)
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func on_anim_finished():
	if (Input.is_action_just_pressed("A")):
		get_node("Moving").play_backwards("goingup")
func _physics_process(delta):
	process_input(delta)
	process_movement(delta)


func process_input(_delta):

	# ----------------------------------
	# Walking
	var is_moving = false
	dir = Vector3()
	var cam_xform = camera.get_global_transform()

	var input_movement_vector = Vector2()

	if Input.is_action_pressed("move_forward"):
		input_movement_vector.y += 0.05
		is_moving = true
			
	if Input.is_action_pressed("move_back"):
		input_movement_vector.y -= 0.1
		is_moving = true
	if Input.is_action_pressed("move_left"):
		input_movement_vector.x -=0.1
		is_moving = true
		
	if Input.is_action_pressed("move_right"):
		input_movement_vector.x += 0.1
		is_moving = true
		

	input_movement_vector = input_movement_vector.normalized()
	sound(is_moving)
	# Basis vectors are already normalized.
	dir += -cam_xform.basis.z * input_movement_vector.y
	dir += cam_xform.basis.x * input_movement_vector.x
	# ----------------------------------
	torch()
	on_anim_finished()
	# ----------------------------------
	# Jumping
	if is_on_floor():
		if Input.is_action_just_pressed("jump"):
			$follow/AudioStreamPlayer3D.stop()
			vel.y = JUMP_SPEED
			$follow/JUMP.play()
	# ----------------------------------

	# ----------------------------------
	# Capturing/Freeing the cursor
	if Input.is_action_just_pressed("ui_cancel"):
		if Input.get_mouse_mode() == Input.MOUSE_MODE_VISIBLE:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		else:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	# ----------------------------------

func torch():
	if GameManager.pickup==1:
		GameManager.pickup=1
		torch_life();
		if Input.is_action_just_pressed("toggle_flashlight") and light.visible == false:
			 light.show()
			 GameManager.lighting=1;#light is on 
			 
		elif Input.is_action_just_pressed("toggle_flashlight") and light.visible == true:
			 light.hide()
			 GameManager.lighting=0; #if flashlight is off 
			
	if GameManager.pickup==1 and GameManager.uv==1:
#---------------------------FLASHLIGHT COLOUR 
		torch_life()
		if Input.is_action_just_pressed("change_lightcolour") and GameManager.red==0 and light.visible == true:
			 light.light_color= Color(1,0,2)
			 torchcoloursound()
			 GameManager.red=1;
		elif Input.is_action_just_pressed("change_lightcolour") and GameManager.red==1 and light.visible == true:
			light.light_color= Color(1,1,1)	
			torchcoloursound()
			GameManager.red=0; #white light
	

func torch_life():
	if GameManager.life<=0:
		light.visible=false
		GameManager.red=0
		
		
func sound(is_moving):
	if is_moving:
		if $follow/Timer.time_left<=0:
			$follow/AudioStreamPlayer3D.pitch_scale=rand_range(0.8,1.2)
			$follow/AudioStreamPlayer3D.play()
			$follow/Timer.start(0.5)


func torchcoloursound():
	$follow/torchswitch.pitch_scale = rand_range(0.8,1.2)
	$follow/torchswitch.play()

func process_movement(delta):
	dir.y = 0
	dir = dir.normalized()

	vel.y += delta * GRAVITY

	var hvel = vel
	hvel.y = 0

	var target = dir
	target *= MAX_SPEED

	var accel
	if dir.dot(hvel) > 0:
		accel = ACCEL
	else:
		accel = DEACCEL

	hvel = hvel.linear_interpolate(target, accel * delta)
	vel.x = hvel.x
	vel.z = hvel.z
	vel = move_and_slide(vel, Vector3(0, 1, 0), 0.05, 4, deg2rad(MAX_SLOPE_ANGLE))


func _input(event):
	if event is InputEventMouseMotion and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		rotation_helper.rotate_x(deg2rad(event.relative.y * MOUSE_SENSITIVITY))
		self.rotate_y(deg2rad(event.relative.x * MOUSE_SENSITIVITY * -1))

		var camera_rot = rotation_helper.rotation_degrees
		camera_rot.x = clamp(camera_rot.x, -70, 70)
		rotation_helper.rotation_degrees = camera_rot
