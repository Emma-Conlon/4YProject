extends Control


var bar_green = preload("res://greem.png")
onready var labeling=$ColorRect2/OBJECTIVE
onready var torchLife=$ProgressBar
onready var word=$Red
onready var level2= $Green

var score=10
func _ready():
	if GameManager.doorOpen==1:
		torchLife.value=GameManager.battery
		
		
func _process(_delta):
	addBatteryPower()
	if GameManager.doorOne==true:
		$RED.show()
		
	if GameManager.doorTwo==true:
		$RED.hide()
		level2.show()
		
	#'if  GameManager.pickup==0: # battery appears when torch is picked up 
	#	torchLife.visible=false
	#else:
	#	torchLife.visible=true'
	if  GameManager.doorOne==true:
		torchLife.value=GameManager.battery
		
		
func _on_Timer_timeout():
	if GameManager.pickup==1:
		torchLife.visible
	if GameManager.pickup==1 and GameManager.lighting==1:
			torchLife.value-=0.05
			GameManager.battery =torchLife.value
			
			
			#------------UV LIGHT 
	if  GameManager.red==1 and GameManager.lighting==1:
		torchLife.value-=0.5
		
		GameManager.battery =torchLife.value
	if  GameManager.lighting==0:
			torchLife.value+=0.01
			GameManager.battery =torchLife.value
	
			
#adds to Score
func redEmeraldsCollected():
	
	if	 GameManager.emerladsMax==GameManager.redEmerladsCollected:
		GameManager.completedGame0ne=true
	
	
func addBatteryPower():
	if GameManager.plus>0:
		torchLife.value=torchLife.value+GameManager.plus
		GameManager.plus=0
