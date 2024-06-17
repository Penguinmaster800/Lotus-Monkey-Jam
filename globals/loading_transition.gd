extends CanvasLayer

var target_area = "res://scenes/levels/area2.tscn"


func change_scene(target: String) -> void:
	$AnimationPlayer.play("fade_to_black")
	await $AnimationPlayer.animation_finished
	get_tree().change_scene_to_file(target)
	$AnimationPlayer.play_backwards("fade_to_black")


func change_area() -> void:
	Status.progress = 10
	$AnimationPlayer.play("fade_to_black")
	await $AnimationPlayer.animation_finished
	get_tree().change_scene_to_file(target_area)
	print(target_area)
	$AnimationPlayer.play_backwards("fade_to_black")
	Status.current_area += 1
	await $AnimationPlayer.animation_finished
	
	check_area()

func check_area():
	if Status.current_area == 1:
		target_area = "res://scenes/levels/area2.tscn"
	if Status.current_area == 2:
		target_area = "res://scenes/levels/area3.tscn"
	if Status.current_area == 3:
		target_area = "res://scenes/levels/victory.tscn"
	else:
		pass
