extends Node2D

@onready var main = $".."
@onready var projectile = load("res://scenes/projectile.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_on_shoot_time_timeout()


func shoot():
	var instance = projectile.instantiate()
	instance.spawnPos = global_position
	main.add_child.call_deferred(instance)



func _on_shoot_time_timeout():
	shoot()
