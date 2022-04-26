extends KinematicBody2D

export (float) var acceleration
export (float) var maxSpeed
var count = 0
var _vel = Vector2.ZERO

func _process(delta):
	var targetPos = get_viewport().get_mouse_position()
	
	if (targetPos != position):
		_vel += (targetPos - position).clamped(acceleration) * delta
		_vel = _vel.clamped(maxSpeed)
		position = position + (_vel * delta)
		
		look_at(position + _vel)
		rotation += PI / 2


func _on_Area2D_body_entered(body):
		if body.is_in_group("Boids"):
			print("bodyHIT")
			body.hide()
			GameManager.boids +=1
			count = GameManager.boids
			print(count)
