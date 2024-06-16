extends Area2D

func _on_body_exited(_body):
	Status.speed += 40

func _on_body_entered(_body):
	Status.stamina -= 10
	Status.speed -= 40
