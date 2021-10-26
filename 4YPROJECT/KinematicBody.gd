extends KinematicBody

export var max_speed = 12
export var gravity = 70
export var jump_impulse = 25

var velocity = Vector3.ZERO

onready var pivot=$Pivot

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().quit()
		
func _physics_process(delta):
	var input_vector = get_input_vector()
	apply_movement(input_vector)
	apply_gravity(delta)
	jump()
	velocity = move_and_slide(velocity, Vector3.UP)
	
	
func get_input_vector():
	var input_vector = Vector3.ZERO
	input_vector.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	input_vector.z = Input.get_action_strength("move_back") - Input.get_action_strength("move_forward")
	if input_vector.length()!=0:
		if $Timer.time_left<=0:
			$AudioStreamPlayer3D.pitch_scale=rand_range(0.8,1.2)
			$AudioStreamPlayer3D.play()
			$Timer.start(0.5)
	return input_vector.normalized()
	

func run():
	var input_vector = Vector3.ZERO
	input_vector.x = Input.get_action_strength("move_run_right") - Input.get_action_strength("move_run_left")
	input_vector.z = Input.get_action_strength("move_run_down") - Input.get_action_strength("move_run_up")
	if Input.get_action_strength("move_run_right") or Input.get_action_strength("move_run_left"):
		if $Timer.time_left<=0:
			$AudioStreamPlayer3D.pitch_scale=rand_range(0.8,1.2)
			$AudioStreamPlayer3D.play()
			$Timer.start(0.2)
	return input_vector.normalized()

func apply_movement(input_vector):
	velocity.x = input_vector.x * max_speed
	velocity.z = input_vector.z * max_speed
	
	if input_vector != Vector3.ZERO:
		pivot.look_at(translation + input_vector, Vector3.UP)
	
	
func apply_gravity(delta):
	velocity.y -= gravity * delta
	

func jump():
	if is_on_floor() and Input.is_action_pressed("jump"):
		$AudioStreamPlayer3D.stop()
		velocity.y = jump_impulse
		$JUMP.play()
