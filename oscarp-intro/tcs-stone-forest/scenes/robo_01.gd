extends CharacterBody2D

@onready var dArr = $"robo1Sprite/left d"
@onready var robo1 =$robo1Sprite
var speed = 50

var direction = -1
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta) :
	velocity.x = speed * direction
	move_and_slide()
	
	if not dArr.is_colliding():
		direction *= -1
		dArr.position.x = abs(dArr.position.x)*direction
		
		if robo1:
			robo1.flip_h = direction > 0
