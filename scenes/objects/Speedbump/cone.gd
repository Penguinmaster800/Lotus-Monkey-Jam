extends Node2D


# Called when the node enters the scene tree for the first time.


func _on_body_entered(body):
	Status.stamina -= 30
	Status.speed += 35
	Status.stamina -= 30
	Status.speed += 35

func _on_body_exited(body):
	Status.speed -= 15 # Replace with function body.
