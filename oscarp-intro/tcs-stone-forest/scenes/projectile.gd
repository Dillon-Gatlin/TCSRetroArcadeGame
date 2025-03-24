extends CharacterBody2D

@export var speed = -100
var dir :float
var spawnPos: Vector2

func _ready():
	global_position = spawnPos
	position.x -= 15
	position.y -= 5

func _physics_process(_delta):
	velocity.x = speed
	move_and_slide()


func _on_area_2d_body_entered(_body) :
	queue_free()
