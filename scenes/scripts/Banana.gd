extends Area2D

func _on_body_entered(_body):
	$AudioStreamPlayer2D.play()
	Status.stamina += 5
	print(Status.stamina)
	$AnimationPlayer.play("Vanish")
	
