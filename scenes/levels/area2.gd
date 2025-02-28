extends LevelParent

#list of area 1 obstacle arrangements
var arrangement_1: PackedScene = preload("res://scenes/levels/Area 2/arrangement_2_1.tscn")
var arrangement_2: PackedScene = preload("res://scenes/levels/Area 2/arrangement_2_2.tscn")
var arrangement_3: PackedScene = preload("res://scenes/levels/Area 2/arrangement_2_3.tscn")
var arrangement_base: PackedScene = preload("res://scenes/levels/arrangement.base.tscn")
var arrangement_4: PackedScene = preload("res://scenes/levels/Area 2/arrangement_2_4.tscn")
var arrangement_5: PackedScene = preload("res://scenes/levels/Area 2/arrangement_2_5.tscn")
var arrangement_6: PackedScene = preload("res://scenes/levels/area 2/arrangement_2_6.tscn")
var arrangement_7: PackedScene = preload("res://scenes/levels/area 2/arrangement_2_7.tscn")
var arrangement_8: PackedScene = preload("res://scenes/levels/area 2/arrangement_2_8.tscn")

var counter = 1

#selection of which arrangement to load
var layout_options := [arrangement_2, arrangement_3, arrangement_4, arrangement_5, arrangement_6, arrangement_7, arrangement_8]
var random_arrangement = layout_options[randi()%len(layout_options)]
func _randomize_arrangement():
	random_arrangement = layout_options[randi()%len(layout_options)]


func _ready():
	_spawn_first_area(arrangement_1)
	_spawn_second_area(arrangement_2)
	counter = 2
	Status.speed = 200
	Status.time_remaining = 60
	print("area2")
	
	super._ready()

func _spawn_first_area(selected_arrangement):
	var loaded_area = selected_arrangement.instantiate() as Node2D
	$LoadedGround.add_child(loaded_area)
	loaded_area.loading_area_entered.connect(_on_loaded_area_body_entered)

func _spawn_second_area(selected_arrangement):
	var loaded_area = selected_arrangement.instantiate() as Node2D
	loaded_area.set_global_position(Vector2(960,0))
	$LoadedGround.add_child(loaded_area)
	loaded_area.loading_area_entered.connect(_on_loaded_area_body_entered)
	
	
func _on_loaded_area_body_entered():
	_spawn_area(random_arrangement)
	print("Loaded area has been entered!")

func _spawn_area(random_arrangement):
	var loaded_area = random_arrangement.instantiate() as Node2D
	loaded_area.set_global_position(Vector2(960*counter,0))
	counter += 1
	$LoadedGround.add_child(loaded_area)
	loaded_area.loading_area_entered.connect(_on_loaded_area_body_entered)
	_randomize_arrangement()
	Status.progress -= 1
