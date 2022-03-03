extends Node
var path_one = "user://save_one.dat"
var path_two = "user://save_two.dat"
var path_three = "user://save_three.dat"
var path_four = "user://save_four.dat"
var loadpos 
var count
var section
var save_data = { 
		"player_name" : "",
		"level" : "",
		"gems" : 0,
		"games_won" : 0,
		"players_position.x" : -33.002,
		"players_position.y" : -4.238,
		"players_position.z" : 13.976,
		"gem_gone" : [],
		"red_gem_max" : 450,
		}# this is to save the game ^^

func loading(var s):
	loadpos = s


func loaded(var res):
	save_data = res

func check(var c):
	count = c 


func gem_dead(var r):
	save_data["gem_gone"].push_back(r)


func gem_count(var collect):
	save_data["gems"] = collect


func pos(var x,var y,var z):
	save_data["players_position.x"] = x
	save_data["players_position.y"] = y
	save_data["players_position.z"] = z
		
func select(var c):
	section = c
	if section == "main_hall":
		save_data["level"] = section
	elif section == "maze":
		save_data["level"] = section
	elif section == "hide&seek":
		save_data["level"] = section
	elif section == "race":
		save_data["level"] = section
	elif section == "boss":
		save_data["level"] = section
	print(save_data["level"])	
	
func level(var lel):
	section = lel
	
	print(save_data["level"])

func load_stage():
	if save_data["level"] == "":
		print("cant_load anything")
	if save_data["level"] == "main_hall":
		var l = get_tree().change_scene("res://test.tscn")
	elif save_data["level"] == "maze":
		var l = get_tree().change_scene("res://Scenes/Maze.tscn")
	elif save_data["level"] == "hide&seek":
		var l = get_tree().change_scene("res://Scenes/GridMap.tscn")
	elif save_data["level"] == "race":
		pass
		#var l = get_tree().change_scene("res://test.tscn")
	elif save_data["level"] == "boss":
		pass
		#var l = get_tree().change_scene("res://test.tscn")
	print(save_data["level"])	
