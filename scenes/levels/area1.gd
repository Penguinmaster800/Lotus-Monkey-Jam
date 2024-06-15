extends LevelParent

#list of area 1 obstacle arrangements
var arrangement_1: PackedScene = preload("res://scenes/levels/area 1/arrangement_1.tscn")
var arrangement_2: PackedScene = preload("res://scenes/levels/area 1/arrangement_2.tscn")
var arrangement_3: PackedScene = preload("res://scenes/levels/area 1/arrangement_3.tscn")



#selection of which arrangement to load
var layout_options := [arrangement_1, arrangement_2, arrangement_3]
var selected_arrangement = layout_options[randi()%len(layout_options)]




#_spawn_area(selected_arrangement)
#	pass
