extends LevelParent

#list of area 1 obstacle arrangements
var arrangement_1: PackedScene = preload("res://scenes/levels/area 1/arrangement_1.tscn")
var arrangement_2: PackedScene = preload("res://scenes/levels/area 1/arrangement_2.tscn")
var arrangement_3: PackedScene = preload("res://scenes/levels/area 1/arrangement_3.tscn")



#selection of which arrangement to load
var layout_options := [arrangement_1, arrangement_2, arrangement_3]
var selected_arrangement = layout_options[randi()%len(layout_options)]


func _ready():
	_spawn_area(arrangement_1)
	super._ready()

#_spawn_area(selected_arrangement)
#	pass
func _spawn_area(selected_arrangement):
	var loaded_area = selected_arrangement.instantiate() as Node2D
	$LoadedGround.add_child(loaded_area)
