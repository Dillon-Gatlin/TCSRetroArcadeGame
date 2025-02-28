extends Area2D


func hit():
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.is_in_group("OscarP"):
			if body is CharacterBody2D:
				body.take_damage(1)
				print("hit")
			
