extends Area2D





func _on_body_entered(body):
	Status.stamina -= 10
	Status.speed += 15



func _on_body_exited(body):
	Status.speed -= 15 # Replace with function body.
