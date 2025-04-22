extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	#checks if "Space" has been pressed.
	if Input.is_action_just_pressed("ui_accept") || Input.is_action_just_pressed("ui_right") || Input.is_action_just_pressed("ui_left"):
		#this next line is reset the scene by changing scenes its to itself.
		get_tree().change_scene_to_file("res://sceneS/main.tscn")
