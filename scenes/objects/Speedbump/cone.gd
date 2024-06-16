extends Node2D


# Called when the node enters the scene tree for the first time.


func _on_body_entered(body):
	Status.stamina -= 10
	Status.speed += 15
	Status.stamina -= 10
	Status.speed += 15

func _on_body_exited(body):
	Status.speed -= 15 # Replace with function body.
