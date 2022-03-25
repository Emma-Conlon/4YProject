extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var result = {}
var file

# Called when the node enters the scene tree for the first time.
func _ready():
	file = File.new()
	if Save.loadpos == 1 and file.file_exists(Save.path_one):
		file.open(Save.path_one,File.READ)
		result = file.get_var()
		$yourname.text = " " + result["player_name"]
		file.close()
	elif Save.loadpos == 2 and file.file_exists(Save.path_two):
		file.open(Save.path_two,File.READ)
		result = file.get_var()
		$yourname.text = " " + result["player_name"]
		file.close()
	elif Save.loadpos == 3 and file.file_exists(Save.path_three):
		file.open(Save.path_three,File.READ)
		result = file.get_var()
		$yourname.text = " " + result["player_name"]
		file.close()
	elif Save.loadpos == 4 and file.file_exists(Save.path_four):
		file.open(Save.path_four,File.READ)
		result = file.get_var()
		$yourname.text = " " + result["player_name"]
		file.close()
	#else:$yourname.text = "YOURNAME"

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
