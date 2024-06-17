extends Control




func _on_play_button_pressed():
	GlobalSounds.play()
	LoadingTransition.change_scene("res://scenes/levels/area1.tscn")



func _on_quit_button_pressed():
	GlobalSounds.play()
	LoadingTransition.change_scene("res://scenes/levels/main_menu.tscn")
