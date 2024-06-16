extends Area2D





func _on_body_entered(body):
	Status.stamina -= 10
	Status.speed += 35



func _on_body_exited(body):
	Status.speed -= 35 # Replace with function body.
