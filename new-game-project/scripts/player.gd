extends CharacterBody2D

@onready var knight = $AnimatedSprite2D
var maxjump = 1
var currentJump = 0
const SPEED = 130.0
const JUMP_VELOCITY = -300.0

func _physics_process(delta: float) -> void:
	# Add gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and currentJump < maxjump:
		velocity.y = JUMP_VELOCITY
		currentJump += 1
	
	if is_on_floor() == true:
		currentJump = 0
	
	# Get movement input.
	var direction := Input.get_axis("ui_left", "ui_right")
	
	if direction:
		velocity.x = direction * SPEED
		knight.flip_h = false
		if direction < 0:
			knight.flip_h = true
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
