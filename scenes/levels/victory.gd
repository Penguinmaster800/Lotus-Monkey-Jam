extends Control


func _on_play_button_pressed():
	GlobalSounds.play()
	LoadingTransition.change_scene("res://scenes/levels/intro_cutscene.tscn")


func _on_quit_button_pressed():
	GlobalSounds.play()
	LoadingTransition.change_scene("res://scenes/levels/main_menu.tscn")
