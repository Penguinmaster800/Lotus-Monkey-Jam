extends Control

func _ready():
	Status.current_area = 1
	Status.change_play_audio.connect(_on_change_play_audio)

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

func _on_credits_button_pressed():
	GlobalSounds.play()
	LoadingTransition.change_scene("res://scenes/levels/Credits.tscn")

func _on_change_play_audio():
	print(Status.play_audio)
	$AudioStreamPlayer.volume_db = -15 if Status.play_audio else -1000
	print($AudioStreamPlayer.volume_db)
