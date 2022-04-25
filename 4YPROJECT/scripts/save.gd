extends Control

var overwrite
var save_data = { 
		"player_name" : "",
		"level" : "",
		"gems" : 0,
		"games_won" : 0,
		"players_position.x" : 0,
		"players_position.y" : 0,
		"players_position.z" : 0,}
var file
var result = {}
var result2 = {}
var result3 = {}
var result4 = {}


func _ready():
	Save.loaded(Save.save_data)
	_loading()
	file = File.new()
	if file.file_exists(Save.path_one):
		Save.loaded(Save.save_data)
		file.open(Save.path_one,File.WRITE)
		file.store_var(Save.save_data)
		file.close()
		print(Save.save_data)
	
#change this so it shows the files and asks for override
func _on_save_one_pressed():
	Save.count = 1
	Save.loading(Save.count)
	file = File.new()
	if file.file_exists(Save.path_one):
		$overwrite.visible = true
		if overwrite == true:
			Save.loaded(Save.save_data)
			file.open(Save.path_one,File.WRITE)
			file.store_var(Save.save_data)
			file.close()
			
	if !file.file_exists(Save.path_one):
		$PopupMenu.visible = true
		file = File.new()
		print("data saved one")
		file.open(Save.path_one,File.WRITE)
		file.store_var(Save.save_data)
		file.close()
		print("data saved one")
	
	
func _on_save_two_pressed():
	Save.count = 2
	Save.loading(Save.count)
	file = File.new()
	if file.file_exists(Save.path_two):
		$overwrite.visible = true
		if overwrite == true:
			Save.loaded(Save.save_data)
			file.open(Save.path_two,File.WRITE)
			file.store_var(Save.save_data)
			file.close()
			
	if !file.file_exists(Save.path_two):
		$PopupMenu.visible = true
		file = File.new()
		print("data saved two")
		file.open(Save.path_two,File.WRITE)
		file.store_var(Save.save_data)
		file.close()
		print("data saved two")


func _on_save_three_pressed():
	Save.count = 3
	Save.loading(Save.count)
	file = File.new()
	if file.file_exists(Save.path_three):
		$overwrite.visible = true
		if overwrite == true:
			Save.loaded(Save.save_data)
			file.open(Save.path_three,File.WRITE)
			file.store_var(Save.save_data)
			file.close()
			
	if !file.file_exists(Save.path_three):
		$PopupMenu.visible = true
		file = File.new()
		print("data saved three")
		file.open(Save.path_three,File.WRITE)
		file.store_var(Save.save_data)
		file.close()
		print("data saved three")

func _on_save_four_pressed():
	Save.count = 4
	Save.loading(Save.count)
	file = File.new()
	if file.file_exists(Save.path_four):
		$overwrite.visible = true
		if overwrite == true:
			Save.loaded(Save.save_data)
			file.open(Save.path_four,File.WRITE)
			file.store_var(Save.save_data)
			file.close()
			
	if !file.file_exists(Save.path_four):
		$PopupMenu.visible = true
		file = File.new()
		print("data saved three")
		file.open(Save.path_four,File.WRITE)
		file.store_var(Save.save_data)
		file.close()
		print("data saved three")

func _on_Button_pressed():
	if file.file_exists(Save.path_one) and Save.count == 1:
		file.open(Save.path_one,File.WRITE)
		Save.save_data["player_name"] = $PopupMenu/LineEdit.get_text()
		file.store_var(Save.save_data)
		file.close()
		$PopupMenu.visible = false
		_loading()
		get_tree().change_scene("res://test.tscn");

	if file.file_exists(Save.path_two) and Save.count == 2:
		file.open(Save.path_two,File.WRITE)
		Save.save_data["player_name"] = $PopupMenu/LineEdit.get_text()
		file.store_var(Save.save_data)
		file.close()
		$PopupMenu.visible = false
		_loading()
		var _vale = get_tree().change_scene("res://intro.tscn");
	
	if file.file_exists(Save.path_three) and Save.count == 3:
		file.open(Save.path_three,File.WRITE)
		Save.save_data["player_name"] = $PopupMenu/LineEdit.get_text()
		file.store_var(Save.save_data)
		file.close()
		$PopupMenu.visible = false
		_loading()
		get_tree().change_scene("res://intro.tscn");
	
	if file.file_exists(Save.path_four) and Save.count == 4:
		file.open(Save.path_four,File.WRITE)
		Save.save_data["player_name"] = $PopupMenu/LineEdit.get_text()
		file.store_var(Save.save_data)
		file.close()
		$PopupMenu.visible = false
		_loading()
		get_tree().change_scene("res://intro.tscn");

func _loading():
	file = File.new()
	if file.file_exists(Save.path_one):
		file.open(Save.path_one,File.READ)
		result = file.get_var()
		label_edit(result)
		file.close()

	if file.file_exists(Save.path_two):
		file.open(Save.path_two,File.READ)
		result2 = file.get_var()
		label_edit_two()
		file.close()

	if file.file_exists(Save.path_three):
			file.open(Save.path_three,File.READ)
			result3 = file.get_var()
			label_edit_three()
			file.close()
	
	if file.file_exists(Save.path_four):
			file.open(Save.path_four,File.READ)
			result4 = file.get_var()
			label_edit_four()
			file.close()


func label_edit(var res):
	res = result
	$save_one/Label.text = "Name : " + res["player_name"]+"\n"+"Level : " + res["level"]+"\n"+"Gems : " + str(res["gems"])

func label_edit_two():
	$save_two/Label.text = "Name : " + result2["player_name"]+"\n"+"Level : " + result2["level"]+"\n"+"Gems : " + str(result2["gems"])

func label_edit_three():
	$save_three/Label.text = "Name : " + result3["player_name"]+"\n"+"Level : " + result3["level"]+"\n"+"Gems : " + str(result3["gems"])

func label_edit_four():
	$save_four/Label.text = "Name : " + result4["player_name"]+"\n"+"Level : " + result4["level"]+"\n"+"Gems : " + str(result4["gems"])
	
	
func _on_yes_pressed():
	overwrite = true
	$overwrite.visible = false
	$PopupMenu.visible = true


func _on_no_pressed():
	overwrite = false
	$overwrite.visible = false


func _on_back_pressed():
	var _vale = get_tree().change_scene("res://Scenes/MainMenu.tscn");
