extends Area2D

var enter = false

func _on_body_entered(body: PhysicsBody2D) -> void:
	enter = true

func _on_body_exited(body: Node2D) -> void:
	enter = false
	
func _process(delta: float) -> void:
	if enter == true:
		if Input.is_action_just_pressed("ui_accept") || Input.is_action_just_pressed("ui_up"):
			get_tree().change_scene_to_file("res://sceneS/2ndFloor.tscn")
