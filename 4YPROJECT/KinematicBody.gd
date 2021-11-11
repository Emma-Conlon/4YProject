extends KinematicBody
signal flashtoggle
const GRAVITY = -24.8
var vel = Vector3()
const MAX_SPEED = 5
const JUMP_SPEED = 18
const ACCEL = 4.5
var dir = Vector3()
var red=false
const DEACCEL= 16
const MAX_SLOPE_ANGLE = 40
onready var light = $follow/SpotLight
var camera
var rotation_helper

var MOUSE_SENSITIVITY = 0.05


func _ready():
	camera = $follow/Camera
	rotation_helper = $follow

	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


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
		GameManager.red;

	input_movement_vector = input_movement_vector.normalized()
	sound(is_moving)
	# Basis vectors are already normalized.
	dir += -cam_xform.basis.z * input_movement_vector.y
	dir += cam_xform.basis.x * input_movement_vector.x
	# ----------------------------------
	torch()
	# ----------------------------------
	# Jumping
	if is_on_floor():
		if Input.is_action_just_pressed("jump"):
			$AudioStreamPlayer3D.stop()
			vel.y = JUMP_SPEED
			$JUMP.play()
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
		
		if Input.is_action_just_pressed("toggle_flashlight") and light.visible == false:
			 light.show()
			 GameManager.lighting=1;#light is on 
			
		elif Input.is_action_just_pressed("toggle_flashlight") and light.visible == true:
			 light.hide()
			 GameManager.lighting=0; #if flashlight is off 
			
	if GameManager.pickup==1 and GameManager.uv==1:
#---------------------------FLASHLIGHT COLOUR 
		if Input.is_action_just_pressed("change_lightcolour") and GameManager.red==0:
			 light.light_color= Color(1,0,2)
			 torchcoloursound()
			 GameManager.red=1;
		elif Input.is_action_just_pressed("change_lightcolour") and GameManager.red==1:
			light.light_color= Color(1,1,1)	
			torchcoloursound()
			GameManager.red=0; #white light
		

func sound(is_moving):
	if is_moving:
		if $Timer.time_left<=0:
			$AudioStreamPlayer3D.pitch_scale=rand_range(0.8,1.2)
			$AudioStreamPlayer3D.play()
			$Timer.start(0.5)


func torchcoloursound():
	$torchswitch.pitch_scale = rand_range(0.8,1.2)
	$torchswitch.play()

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
