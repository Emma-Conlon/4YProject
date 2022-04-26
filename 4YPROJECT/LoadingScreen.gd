extends Control

export var MainHall=""
export var entrance=""
export var racing=""
export var hide_seek=""
export var final=""
var load_time=1
 

func _process(_delta):
	if  GameManager.doorOne==true :#for door 1 
		$TextureProgress.tint_progress=  Color( 0.25, 0.41, 0.88, 1 )
		$ColorRect.color=Color( 0.53, 0.81, 0.98, 1 ) 
	if GameManager.doorTwo==true: # game 2 loading 
		$TextureProgress.tint_progress=  Color( 0.98, 0.5, 0.45, 1 )
		$ColorRect.color=Color( 1, 0.63, 0.48, 1 )
	if GameManager.doorThree==true: # game 2 loading 
		$TextureProgress.tint_progress=  Color( 153, 0, 204, 1 )
		$ColorRect.color=Color( 204, 51, 255, 1 )
	
	

#func _on_Tween_tween_all_completed():
	#if MainHall!=null:
			#get_tree().change_scene(MainHall
			
func _on_Timer_timeout():
	if GameManager.life==1:
		$TextureProgress.value+=10
		
	if($TextureProgress.value>=90):
			if GameManager.doorOne==true:
				save_maze()
				get_tree().change_scene(MainHall)
			if GameManager.loading==1:
				_save()
				get_tree().change_scene(entrance)
			if GameManager.doorTwo==true:
				save_hideseek()
				get_tree().change_scene(hide_seek)
				GameManager.completedGame0ne=true
			if GameManager.doorThree == true:
				get_tree().change_scene(racing)
	pass # Replace with function body.
func _save():
	var path_one = "user://save_one.dat"
	var path_two = "user://save_two.dat"
	var path_three = "user://save_three.dat"
	var path_four = "user://save_four.dat"
	var file = File.new()
	if Save.loadpos == 1 and file.file_exists(path_one):
		file.open(path_one,File.WRITE)
		Save.pos(-33.002,-4.238,13.976)
		file.store_var(Save.save_data)
		file.close()
	if Save.loadpos == 2 and file.file_exists(path_two):
		file.open(path_two,File.WRITE)
		Save.pos(-33.002,-4.238,13.976)
		file.store_var(Save.save_data)
		file.close()
	if Save.loadpos == 3 and file.file_exists(path_three):
		file.open(path_two,File.WRITE)
		Save.pos(-33.002,-4.238,13.976)
		file.store_var(Save.save_data)
		file.close()
	if Save.loadpos == 4 and file.file_exists(path_four):
		file.open(path_four,File.WRITE)
		Save.pos(-33.002,-4.238,13.976)
		file.store_var(Save.save_data)
		file.close()


func save_maze():
	var path_one = "user://save_one.dat"
	var path_two = "user://save_two.dat"
	var path_three = "user://save_three.dat"
	var path_four = "user://save_four.dat"
	var file = File.new()
	if Save.loadpos == 1 and file.file_exists(path_one):
		file.open(path_one,File.WRITE)
		Save.pos(39.652,2.125,-9.85)
		file.store_var(Save.save_data)
		file.close()
	if Save.loadpos == 2 and file.file_exists(path_two):
		file.open(path_two,File.WRITE)
		Save.pos(39.652,2.125,-9.85)
		file.store_var(Save.save_data)
		file.close()
	if Save.loadpos == 3 and file.file_exists(path_three):
		file.open(path_two,File.WRITE)
		Save.pos(39.652,2.125,-9.85)
		file.store_var(Save.save_data)
		file.close()
	if Save.loadpos == 4 and file.file_exists(path_four):
		file.open(path_four,File.WRITE)
		Save.pos(39.652,2.125,-9.85)
		file.store_var(Save.save_data)
		file.close()
		
func save_hideseek():
	var path_one = "user://save_one.dat"
	var path_two = "user://save_two.dat"
	var path_three = "user://save_three.dat"
	var path_four = "user://save_four.dat"
	var file = File.new()
	if Save.loadpos == 1 and file.file_exists(path_one):
		file.open(path_one,File.WRITE)
		if GameManager.completedGame0ne:
			Save.save_data["gems"] = 0
		Save.pos(-30.797,4.566,6.538)
		file.store_var(Save.save_data)
		file.close()
	if Save.loadpos == 2 and file.file_exists(path_two):
		file.open(path_two,File.WRITE)
		if GameManager.completedGame0ne:
			Save.save_data["gems"] = 0
		Save.pos(-30.797,4.566,6.538)
		file.store_var(Save.save_data)
		file.close()
	if Save.loadpos == 3 and file.file_exists(path_three):
		file.open(path_two,File.WRITE)
		if GameManager.completedGame0ne:
			Save.save_data["gems"] = 0
		Save.pos(-30.797,4.566,6.538)
		file.store_var(Save.save_data)
		file.close()
	if Save.loadpos == 4 and file.file_exists(path_four):
		file.open(path_four,File.WRITE)
		if GameManager.completedGame0ne:
			Save.save_data["gems"] = 0
		Save.pos(-30.797,4.566,6.538)
		file.store_var(Save.save_data)
		file.close()

