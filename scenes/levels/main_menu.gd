extends Control

func _ready():
	$MarginContainer/Control/AnimatedSprite2D.play()

func _on_quit_button_pressed():
	get_tree().quit()

func _on_play_button_pressed():
	LoadingTransition.change_scene("res://scenes/levels/area1.tscn")

func _on_timer_timeout():
	var animation_index = randi_range(0, 2)
	if (animation_index == 0):
		$MarginContainer/Control/AnimatedSprite2D.play("default")
	elif animation_index == 1:
		$MarginContainer/Control/AnimatedSprite2D.play("look")
	else:
		$MarginContainer/Control/AnimatedSprite2D.play("happy")
