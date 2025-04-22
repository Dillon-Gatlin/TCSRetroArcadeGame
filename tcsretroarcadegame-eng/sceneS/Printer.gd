extends CharacterBody2D

@onready var dArr = $"printer/Down"
@onready var Wall = $"printer/Horizontal"
@onready var robo1 =$printer
var speed = 50

var direction = -1
func _ready() -> void:
	pass 


func _process(_delta) :
	velocity.x = speed * direction
	move_and_slide()
	
	if not dArr.is_colliding():
		direction *= -1
		dArr.position.x = abs(dArr.position.x)*direction
		
		if robo1:
			robo1.flip_h = direction > 0
			
	if is_on_wall():
		direction *= -1
		Wall.position.x = abs(Wall.position.x)*direction
		if robo1:
			robo1.flip_h = direction > 0
			
