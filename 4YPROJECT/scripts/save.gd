extends Control

var overwrite
var save_path_one = "user://save_one.dat"
var save_path_two = "user://save_two.dat"
var save_path_three = "user://save_three.dat"
var save_path_four = "user://save_four.dat"
var save_data = { 
		"player_name" : "",
		"level" : "main_hall",
		"gems" : 0,
		"games_won" : 0,
		"players_position.x" : 0,
		"players_position.y" : 0,
		"players_position.z" : 0,}
var file
var result = {}
#change this so it shows the files and asks for override
func _on_save_one_pressed():
	file = File.new()
	if file.file_exists(save_path_one):
		$overwrite.visible = true
		if overwrite == true:
			Save.loaded(save_data)
			file.open(save_path_one,File.WRITE)
			file.store_var(Save.save_data)
			file.close()
			
	if !file.file_exists(save_path_one):
		$PopupMenu.visible = true
		file = File.new()
		print("data saved one")
		file.open(save_path_one,File.WRITE)
		file.store_var(Save.save_data)
		file.close()
		print("data saved one")
	
	
func _on_save_two_pressed():
	var _vale = get_tree().change_scene("res://test.tscn");


func _on_save_three_pressed():
	var _vale = get_tree().change_scene("res://test.tscn");


func _on_save_four_pressed():
	var _vale = get_tree().change_scene("res://test.tscn");


func _on_Button_pressed():
	file.open(save_path_one,File.WRITE)
	save_data["player_name"] = 	$PopupMenu/LineEdit.get_text()
	file.store_var(save_data)
	file.close()
	$PopupMenu.visible = false
	_loading()
	var _vale = get_tree().change_scene("res://test.tscn");

func _loading():
	file = File.new()
	if file.file_exists(save_path_one):
		file.open(save_path_one,File.READ)
		result = file.get_var()
		label_edit(result)
		var player_data = file.get_var()
		file.close()
func label_edit(var res):
	res = result
	$save_one/Label.text = "Name : " + res["player_name"]+"\n"+"Level : " + res["level"]+"\n"+"Gems : " + str(res["gems"])
	
func _ready():
	Save.loaded(save_data)
	_loading()

func _on_yes_pressed():
	overwrite = true
	$overwrite.visible = false
	$PopupMenu.visible = true

func _on_no_pressed():
	overwrite = false
	$overwrite.visible = false


func _on_back_pressed():
	var _vale = get_tree().change_scene("res://Scenes/MainMenu.tscn");
