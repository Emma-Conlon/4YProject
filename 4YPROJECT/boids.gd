extends KinematicBody

# these weights where defined through
# trial and error. You can play with them
# to check how they affect the flock.
const SEPARATION_WEIGHT = 0.5
const ALIGNMENT_WEIGHT = 0.5
const COHESION_WEIGHT = 0.1


var _max_speed = 10
var _speed = 5
var _direction = Vector3(1, 0,1)
var _separation_distance = 20

var _local_flockmates = []


func _physics_process(_delta):
	Vector3(_direction).angle_to(Vector3.FORWARD)
	#self.rotate= Vector2(1, 0).angle_to(_direction)
	#self.rotation = Vector2(0, 1).angle_to(_direction)
	var collision = self.move_and_collide(_direction * _speed)
	#if collision:
		#if collision.collider is GridMap:
		#	print("hitting")
	_direction = _collision_reaction_direction(collision)
	#else:
		#print("going here")
	#_direction = _flock_direction()


# Inverts the direction whenhitting a collider.
# This implementation handles colliding with Tilemaps specifically.
func _collision_reaction_direction(collision):
	return (collision.position - collision.normal).direction_to(self.position)


# This function is pretty much all you need for calculating
# the flocking movement
func _flock_direction():
	var separation = Vector3()
	var heading = _direction
	var cohesion = Vector3()

	for flockmate in _local_flockmates:
		heading += flockmate.get_direction()
		cohesion += flockmate.position

		var distance = self.position.distance_to(flockmate.position)

		if distance < _separation_distance:
			separation -= (flockmate.position - self.position).normalized() * (_separation_distance / distance * _speed)

	if _local_flockmates.size() > 0:
		heading /= _local_flockmates.size()
		cohesion /= _local_flockmates.size()
		var center_direction = self.position.direction_to(cohesion)
		var center_speed = _max_speed * self.position.distance_to(cohesion) / $detection_radius/CollisionShape2D.shape.radius
		cohesion = center_direction * center_speed

	return (
		_direction +
		separation * SEPARATION_WEIGHT +
		heading * ALIGNMENT_WEIGHT +
		cohesion * COHESION_WEIGHT
	)#.clamped(_max_speed)


func get_direction():
	return _direction


func set_direction(direction):
	_direction = direction


func _on_detection_radius_body_entered(body):
	if body == self:
		return

	if body.is_in_group("boid"):
		_local_flockmates.push_back(body)


func _on_detection_radius_body_exited(body):
	if body.is_in_group("boid"):
		_local_flockmates.erase(body)
