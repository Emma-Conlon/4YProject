extends Label

onready var score= get_node(".")

func _process(delta):
	score.text=str(GameManager.redEmerladsCollected)
