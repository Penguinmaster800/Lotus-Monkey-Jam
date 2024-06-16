extends CanvasLayer

func _ready():
	$AnimationPlayer.play("Intro")
	await $AnimationPlayer.animation_finished
	LoadingTransition.change_scene("res://scenes/levels/area1.tscn")
	
	
func _on_play_button_pressed():
	LoadingTransition.change_scene("res://scenes/levels/area1.tscn")
