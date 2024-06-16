extends CharacterBody2D

# The height of each lane in pixels
var lane_height: int = 36
# The maximum (lowest lane) y coord for the player
var max_y_coord: int = 0
# The minimum (highest lane) y coord for the player
var min_y_coord: int = 0
# The starting lane's y coord for the player to go to on start
var start_y_coord: int = 0
# The starting x coord for the player
const START_X_COORD: int = 32
# Determins if the player is already moving to a lane
@export var is_moving: bool = false
# The target position for the player to move
var target
# The speed of the player in pixels/sec
@export var speed: int = 8000

# Called when the node enters the scene tree for the first time.
func _ready():
	target = position
	Status.stat_change.connect(_on_stat_change)
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Slide the player into the target lane
	velocity = position.direction_to(target) * speed * delta
	if position.distance_to(target) > 1:
		move_and_slide()
	else:
		# Snap the player to the target when they are close enough to prevent
		#  blurry pixels
		position = target
		is_moving = false

# Called when an input is received
# Using this instead of _process so that each action press will always result in
#  the player ending their movement in the center of a lane
func _input(event):
	if event.is_action_pressed("player_up") and not is_moving:
		move_to_y_pos(position.y - lane_height)
	elif event.is_action_pressed("player_down") and not is_moving:
		move_to_y_pos(position.y + lane_height)

# Moves the player to the specified y coordinate or the limits of the lanes if 
#  it would exceed those limits
func move_to_y_pos(y_pos: float):
	is_moving = true
	target = Vector2(position.x, clamp(
		y_pos,
		min_y_coord,
		max_y_coord
	))

# Called when a connected level declares itself ready.
# Setup the player so it is capable to switching between lanes properly
func _on_level_level_ready(level_lane_count, level_lane_height, level_bottom_lane_y_coord):
	max_y_coord = level_bottom_lane_y_coord
	# Calculate the upper lane's y coordinate
	min_y_coord = level_bottom_lane_y_coord - ((level_lane_count - 1) * level_lane_height)
	lane_height = level_lane_height
	# We want the player to start near the center of the lanes so calculate the y coord for the
	#  nearest middle lane
	start_y_coord = level_bottom_lane_y_coord - (floor((level_lane_count - 1) / 2) * level_lane_height)

	# Set the initial target for the 
	target = Vector2(START_X_COORD, start_y_coord)
	is_moving = true

func _on_stat_change():
	$TextureProgressBar.value = Status.stamina
