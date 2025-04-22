extends StaticBody2D

@export var spring = 3

var used = false
var stop = false
func _physics_process(delta: float) -> void:
	jump()

func jump():
	if used == true and stop == false:
		$AnimatedSprite2D.play("active")

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("OscarP") and used == false:
		used = true
		body.spring_jump(spring)
	


func _on_animated_sprite_2d_animation_finished() -> void:
	$AnimatedSprite2D.play("idle")
	stop = true
	await get_tree().create_timer(.1).timeout
	used = false
	stop = false
