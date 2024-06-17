extends Area2D


func _on_body_entered(_body):
	$AudioStreamPlayer2D.play()
	Status.stamina -= 10
	Status.speed -= 50
	$Timer.start()
func _on_timer_timeout():
	Status.speed += 50



