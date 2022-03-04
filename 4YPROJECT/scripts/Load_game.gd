extends Control

var file
var result4 = {}
var result3 = {}
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
	if count == 3:
		$Panel/save_three/Label.text = "Name : " + result3["player_name"]+"\n"+"Level : " + result3["level"]+"\n"+"Gems : " + str(result3["gems"])
	if count == 4:
		$Panel/save_four/Label.text = "Name : " + result4["player_name"]+"\n"+"Level : " + result4["level"]+"\n"+"Gems : " + str(result4["gems"])


func loading():
	file = File.new()
	if file.file_exists(Save.path_one):
		file.open(Save.path_one,File.READ)
		result = file.get_var()
		print(result)
		label_edit_one(1)
		file.close()

	file = File.new()
	if file.file_exists(Save.path_two):
		file.open(Save.path_two,File.READ)
		result2 = file.get_var()
		print(result2)
		label_edit_one(2)
		file.close()
	
	file = File.new()
	if file.file_exists(Save.path_three):
		file.open(Save.path_three,File.READ)
		result3 = file.get_var()
		print(result3)
		label_edit_one(3)
		file.close()
	
	file = File.new()
	if file.file_exists(Save.path_four):
		file.open(Save.path_four,File.READ)
		result4 = file.get_var()
		print(result4)
		label_edit_one(4)
		file.close()


func _on_load_one_pressed():
	Save.count = 1
	Save.loading(Save.count)
	if file.file_exists(Save.path_one):
		Save.select(result["level"])
		Save.load_stage()
	else:
		print("NO_DATA")



func _on_save_two_pressed():
	Save.count = 2
	Save.loading(Save.count)
	if file.file_exists(Save.path_two):
		Save.select(result2["level"])
		Save.load_stage()
	else:
		print("NO_DATA")
		



func _on_save_three_pressed():
	Save.count = 3
	Save.loading(Save.count)
	if file.file_exists(Save.path_three):
		Save.select(result3["level"])
		Save.load_stage()
	else:
		print("NO_DATA")


func _on_save_four_pressed():
	Save.count = 4
	Save.loading(Save.count)
	if file.file_exists(Save.path_four):
		Save.select(result4["level"])
		Save.load_stage()
	else:
		print("NO_DATA")
