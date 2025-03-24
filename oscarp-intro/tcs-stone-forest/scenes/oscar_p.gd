extends CharacterBody2D
@onready var oscarP =$oscarP

#speed of character. if you change the speed you might have to adjust 
#animation frames on animated sprit, that way the animations don't look off.
const SPEED = 150.0
#Speed of the jump velocity (y speed)
#higher number means greater jump (-numbers mean going upward in godot, I couldnt tell you why)
const JUMP_VELOCITY = -300.0
#this is how we will switch between small and big
var heart = 2


func _physics_process(delta: float):
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		#now we will use a ladder to play the correct animation 
		if (heart == 2):
			oscarP.play("bigJump")
		else:
			oscarP.play("litJump")
		
	#this is to prevent animations from playing while moving in air
	if is_on_floor():
		#if moving in x or y direction 
		if(velocity.x >1 || velocity.x < -1):
			#plays walk animation
			#now we will use a ladder to play the correct animation 
			if (heart == 2):
				oscarP.play("bigWalk")
			else:
				oscarP.play("litWalk")
		else:
			#plays idle animation
			#now we will use a ladder to play the correct animation 
			if (heart == 2):
				oscarP.play("bigIdle")
			else:
				oscarP.play("litIdle")
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	# Since we are creating this for an arcade game stick to ui_left, ui_right, and ui_accept
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	#flips sprite for going left or right
	if Input.is_action_just_pressed("ui_left"):
		oscarP.flip_h = true
	if Input.is_action_just_pressed("ui_right"):
		oscarP.flip_h = false
		
	move_and_slide()

#function to remove a heart from OscarP
func take_damage(amount):
	heart -= amount


#using global groupings/nodes we can create this function for registering hitboxes
#in this example we have a hitbox on OscarP and Enemy 
func _on_op_area_area_entered(area: Area2D) :
	if area.is_in_group("enemy"):
		take_damage(1)
	if area.is_in_group("worldBounds"):
		heart = 0
	
