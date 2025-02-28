extends Node2D
#refrences the OscarP class/node.
@onready var op =$OscarP

#this is for the paused function
var paused = false
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float):
	#if Main Characters heart reaches 0 do this
	if (op.heart == 0):
		#this changes scenes in the project to the death screen
		get_tree().change_scene_to_file("res://death.tscn")

#this function will pause the main game. would be used if the game was meant for online distritbution or
#if it would go on a hardware device that allows other games as options. 
#since this is an arcade game we wont need this since the game will always be running. 
func pauseMenu():
	if not paused:
		get_tree().paused = true
	else:
		get_tree().paused = false
	
	paused = !paused
