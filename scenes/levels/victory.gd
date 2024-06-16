extends Control





func _on_play_button_pressed():
	LoadingTransition.change_scene("res://scenes/levels/area1.tscn")


func _on_quit_button_pressed():
	LoadingTransition.change_scene("res://scenes/levels/main_menu.tscn")
