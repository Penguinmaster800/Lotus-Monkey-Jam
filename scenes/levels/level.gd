extends Node2D
class_name LevelParent



var move_speed: int = 20
#var path: PackedScene = preload(current_area)



func _spawn_area(selected_arrangement):
	var loaded_area = selected_arrangement.instantiate() as Area2D
	print(selected_arrangement)


