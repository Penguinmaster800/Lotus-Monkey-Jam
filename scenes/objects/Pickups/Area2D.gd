extends Area2D



func _on_body_entered(body):
	Status.lives += 1
	print(Status.lives)
	queue_free()  #removes image when picked up
