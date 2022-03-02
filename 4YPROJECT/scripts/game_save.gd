extends Node


var save_data = { 
		"player_name" : "",
		"level" : "main_hall",
		"gems" : 0,
		"games_won" : 0,
		"players_position.x" : 0,
		"players_position.y" : 0,
		"players_position.z" : 0,}# this is to save the game ^^

func loaded(var res):
	save_data = res
