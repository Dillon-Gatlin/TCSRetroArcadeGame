extends Node2D
@onready var op = $CharacterBody2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if op.heart ==0:
		get_tree().change_scene_to_file("res://scenes/death.tscn")
