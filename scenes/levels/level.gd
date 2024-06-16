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
	lane_height = 32
	bottom_lane_y_coord = get_viewport_rect().size.y - lane_height
	level_ready.emit(lane_count, lane_height, bottom_lane_y_coord)
	
	#connect signal to determine when to load new level
	Status.connect("progress_change", current_progress)
	
func current_progress():
	progress_so_far = int(Status.progress)
	reach_end()


func reach_end():
	if progress_so_far <= 1:
		LoadingTransition.change_area()
	else: 
		pass

func _process(delta):
	# Steadily move the level to the left
	position = position.move_toward(target, delta * move_speed)

