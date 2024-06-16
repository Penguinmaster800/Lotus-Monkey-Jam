extends Area2D


func _on_body_entered(_body):
	Status.stamina -= 20
	Status.lives -= 1
	print(Status.lives)
	print("lives")
