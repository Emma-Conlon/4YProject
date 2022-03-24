extends Label

onready var score= get_node(".")
var gems = {}
var file = File.new()

func _ready():
	#loading()
	pass
		
func _process(delta):
	score.text=str(GameManager.redEmerladsCollected)



func loading():
	if file.file_exists(Save.path_one) and Save.loadpos == 1:
		file.open(Save.path_one,File.READ)
		gems = file.get_var()
		print(gems)
		score.text=str(gems["gems"])
		GameManager.redEmerladsCollected = gems["gems"]
		file.close()
		
	if file.file_exists(Save.path_two) and Save.loadpos == 2:
		file.open(Save.path_two,File.READ)
		gems = file.get_var()
		score.text=str(gems["gems"])
		GameManager.redEmerladsCollected = gems["gems"]
		file.close()
		
	if file.file_exists(Save.path_three) and Save.loadpos == 3:
		file.open(Save.path_three,File.READ)
		gems = file.get_var()
		score.text=str(gems["gems"])
		GameManager.redEmerladsCollected = gems["gems"]
		file.close()
		
	if file.file_exists(Save.path_four) and Save.loadpos == 4:
		file.open(Save.path_four,File.READ)
		gems = file.get_var()
		score.text=str(gems["gems"])
		GameManager.redEmerladsCollected = gems["gems"]
		file.close()
