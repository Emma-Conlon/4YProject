extends Control

var load_path_one = "user://save_one.dat"
var load_path_two = "user://save_two.dat"
var load_path_three = "user://save_three.dat"
var load_path_four = "user://save_four.dat"
var file
var result = {}
func _on_Button_pressed():
	var _value = get_tree().change_scene("res://Scenes/MainMenu.tscn")


func _ready():
	result = Save.save_data
	print(result)
	loading()
	
	
func label_edit_one(var res):
	
	$Panel/save_one/Label.text = "Name : " + res["player_name"]+"\n"+"Level : " + res["level"]+"\n"+"Gems : " + str(res["gems"])

func loading():
	file = File.new()
	if file.file_exists(load_path_one):
		file.open(load_path_one,File.READ)
		result = file.get_var()
		label_edit_one(result)
		file.close()
	else:
		return
