extends Control

func _ready():
	Status.current_area = 1

func _on_quit_button_pressed():
	GlobalSounds.play()
	get_tree().quit()

func _on_play_button_pressed():
	GlobalSounds.play()
	LoadingTransition.change_scene("res://scenes/levels/intro_cutscene.tscn")

func _on_timer_timeout():
	var animation_index = randi_range(0, 2)
	if (animation_index == 0):
		$MarginContainer/Control/AnimatedSprite2D.play("default")
	elif animation_index == 1:
		$MarginContainer/Control/AnimatedSprite2D.play("look")
	else:
		$MarginContainer/Control/AnimatedSprite2D.play("happy")
