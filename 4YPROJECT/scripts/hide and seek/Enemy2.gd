extends KinematicBody

var move_speed = 3.0

enum STATE {IDLE, WANDER}
var state = STATE.IDLE

onready var start_position = get_global_transform().origin
onready var target_position = get_global_transform().origin

var nav = null
var path = []

var stop_distance = 1.0

func _ready():
	nav = get_parent() # Navigation node is parent of enemy node in the scene tree during run-time

func _process(delta):
	match state:
		STATE.IDLE:
			var next_waypoint = Vector3(rand_range(5, 20), translation.y, rand_range(5, 20))
			target_position = start_position + next_waypoint
			var p = nav.get_simple_path(start_position, target_position, true)
			if not p.empty():
				path = Array(p)
				path.invert()
				state = STATE.WANDER
		STATE.WANDER:
			var to_walk = delta * move_speed
			var to_watch = Vector3.UP
			while to_walk > 0 and path.size() >= 2:
				var pfrom = path[path.size() - 1]
				var pto = path[path.size() - 2]
				to_watch = (pto - pfrom).normalized()
				var d = pfrom.distance_to(pto)
				if d <= to_walk:
					path.remove(path.size() - 1)
					to_walk -= d
				else:
					path[path.size() - 1] = pfrom.linear_interpolate(pto, to_walk / d)
					to_walk = 0
				var atpos = path[path.size() - 1]
				var atdir = to_watch
				atdir.y = 0
				var t = Transform()
				t.origin = atpos
				t = t.looking_at(atpos + atdir, Vector3.UP)
				set_transform(t)
				if path.size() < 2:
					path = []
					set_process(false)
			if (target_position - transform.origin).length() < stop_distance:
				start_position = get_global_transform().origin
				state = STATE.IDLE
