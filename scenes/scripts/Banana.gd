extends Area2D

func _on_body_entered(_body):
	Status.stamina += 10
	print(Status.stamina)
	queue_free()  #removes image when picked up
