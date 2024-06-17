extends Node2D
class_name LevelParent

# The speed at which the level moves in pixels/sec
@export var move_speed: int = 800
# The length of the level in pixels
@export var level_length: int = 10000
# The target coordinates that the level whill move towards
var target: Vector2
# Indicates that the level has finished setting up
signal level_ready(lane_count: int, lane_height: int, bottom_lane_y_coord: float)
# The number of lanes in the level
var lane_count: int
# The distance between each lane in pixels
var lane_height: int
# The y coordinate for the first (lowest) lane in the level
var bottom_lane_y_coord: float

var progress_so_far = 10


func _ready():
	move_speed = Status.speed
	# Set the target for the level to be far to the left so it appears like the
	#  the player is moving to the right
	target = Vector2(position.x - level_length, position.y)
	# Set defaults for all subsequent levels
	lane_count = Status.current_area + 2
	lane_height = 16
	bottom_lane_y_coord = get_viewport_rect().size.y - lane_height
	level_ready.emit(lane_count, lane_height, bottom_lane_y_coord)
	
	#connect signal to determine when to load new level
	Status.connect("progress_change", current_progress)
	Status.connect("stat_change", flag_stats)
	Status.connect("speed_change", update_speed)
	Status.connect("time_change", flag_time)
	#Status.connect("area_change", update_area)
	#update_area()
	
	


#func update_area():
	#if Status.current_area == 1:
	#	$AudioStreamPlayer.instantiate_playback("res://graphics/Music/Aylex - Fun is Fun (freetouse.com)Level-1.mp3")
	#if Status.current_area == 2:
	#	$AudioStreamPlayer.instantiate_playback("res://graphics/Music/Aylex - Spring (freetouse.com)Level-2.mp3")
	#if Status.current_area == 3:
	#	$AudioStreamPlayer.instantiate_playback("res://graphics/Music/Piki - Happy Walking (freetouse.com)(Level3).mp3")


func update_sky():
	if Status.current_area == 1:
		$AnimationPlayer.play("Area 1 sky")
	if Status.current_area == 2:
		$AnimationPlayer.play("Area 1 sky")
	if Status.current_area == 3:
		$AnimationPlayer.play("Area 1 sky")
	else: pass

func current_progress():
	progress_so_far = int(Status.progress)
	reach_end()

func flag_stats():
	check_health()
	check_stamina()

func check_health():
	if Status.lives <= 0:
		LoadingTransition.change_scene("res://scenes/levels/bike_broke.tscn")
	if Status.lives >= 11:
		Status.lives = 10

func check_stamina():
	if Status.stamina <= 1:
		if Status.speed >= 110:
			Status.speed -= 100
			$StaminaRestore.start()
		else: pass
	if Status.stamina >= 40:
		if Status.speed <= 70:
			Status.speed += 90
		else: pass
	if Status.stamina >= 101:
		Status.stamina = 100

func flag_time():
	if Status.time_remaining <= 0:
		LoadingTransition.change_scene("res://scenes/levels/time_out_cutscene.tscn")

func reach_end():
	if progress_so_far <= 1:
		LoadingTransition.change_area()
	else: 
		pass

func _process(delta):
	# Steadily move the level to the left
	position = position.move_toward(target, delta * move_speed)

func _on_stamina_restore_timeout():
	if Status.stamina <= 100:
		Status.stamina += 60

func _on_stamina_drain_timeout():
	Status.stamina -=1

func update_speed():
	move_speed = Status.speed
