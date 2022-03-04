extends GridMap

onready var player=$Player/Moving
onready var lift=$elevator/moving

func _physics_process(_delta):
	GameManager.doorTwo=true
	
func _ready():
	_get_save()
	
func _get_save():
	var section = "hide&seek"
	Save.level(section)
	Save.save_data["level"] = "hide&seek"
	print(Save.save_data["level"])
	return Save.save_data



