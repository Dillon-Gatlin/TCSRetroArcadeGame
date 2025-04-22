extends Node2D


@onready var main = get_tree().get_root().get_node("main")
@onready var projectile = load("res://sceneS/projectile.tscn")
func _ready() -> void:
	pass 


func _process(delta: float) -> void:
	var instance = projectile.instantiate()
	instance.dir = rotation
	instance.pos = global_position
	instance.rot = rotation
	main.add_child.call_deferred(instance)
