extends CharacterBody2D
@onready var oscarp: CharacterBody2D = $"."
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

const SPEED = 150.0
const JUMP_VELOCITY = -300.0

var gravity = ProjectSettings.get_setting('physics/2d/default_gravity')

var heart = 2
func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
		if (heart == 2):
			animated_sprite_2d.play("bigjump")
		else:
			animated_sprite_2d.play("litjump")

	if is_on_floor():
		if (velocity.x > 1 || velocity.x < -1):
			if (heart == 2):
				animated_sprite_2d.play("bigwalk")
			else:
				animated_sprite_2d.play("litwalk")
		else:
			if (heart == 2):
				animated_sprite_2d.play("bigidle")
			else:
				animated_sprite_2d.play("litidle")

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	if Input.is_action_just_pressed("move_left"):
		animated_sprite_2d.flip_h = true
	if Input.is_action_just_pressed("move_right"):
		animated_sprite_2d.flip_h = false
		
	move_and_slide()

func tak_damage(amount):
	heart -= amount
	


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("enemy"):
		tak_damage(1)
