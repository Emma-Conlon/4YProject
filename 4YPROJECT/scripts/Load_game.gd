extends Control

var load_path_one = "user://save_one.dat"
var load_path_two = "user://save_two.dat"
var load_path_three = "user://save_three.dat"
var load_path_four = "user://save_four.dat"
var file
var result2 = {}
var result = {}
func _on_Button_pressed():
	var _value = get_tree().change_scene("res://Scenes/MainMenu.tscn")


func _ready():
	loading()


	
	
func label_edit_one(var count ):
	if count == 1:
		$Panel/save_one/Label.text = "Name : " + result["player_name"]+"\n"+"Level : " + result["level"]+"\n"+"Gems : " + str(result["gems"])
	if count == 2:
		$Panel/save_two/Label.text = "Name : " + result2["player_name"]+"\n"+"Level : " + result2["level"]+"\n"+"Gems : " + str(result2["gems"])

func loading():
	file = File.new()
	if file.file_exists(load_path_one):
		file.open(load_path_one,File.READ)
		result = file.get_var()
		print(result)
		label_edit_one(1)
		file.close()

		file = File.new()
	if file.file_exists(load_path_two):
		file.open(load_path_two,File.READ)
		result2 = file.get_var()
		print(result2)
		label_edit_one(2)
		file.close()


func _on_load_one_pressed():
	Save.count = 1
	Save.loading(Save.count)
	if file.file_exists(load_path_one):
		Save.select(result["level"])
		Save.load_stage()
	else:
		print("NO_DATA")



func _on_save_two_pressed():
	Save.count = 2
	Save.loading(Save.count)
	if file.file_exists(load_path_two):
		Save.select(result2["level"])
		Save.load_stage()
	else:
		print("NO_DATA")
