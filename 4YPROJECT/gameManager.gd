extends Node

enum {
	IDLE,
	PATROL,
	CHASE,
	ATTACK

}

var love=IDLE;
var red=0;
var lighting=0;	#checks if flashlight
var pickup=0;#check to see if you pickup the torch 
var uv=0;
var life=1;
var plus=0;
var doorOpen=0;
var  battery=100;
var loading=0
var doorOne=false
var doorTwo=false
var doorThree=false
var doorFour=false
var completedGame0ne=false
var completedGameTwo=false
var completedGameThree=false
var completedGameFour=false
var redEmerladsCollected=0 #sees how much you have collected :) 
var greenEmerladsCollected=0 #sees how much you have collected :) 
var emerladsMax=2;
#var emerladsMax=450;
var clicked=false
var dead =false;
var button1=false;
