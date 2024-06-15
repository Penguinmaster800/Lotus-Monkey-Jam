extends CharacterBody2D

# TODO: Get the top and bottom lane y coordinate from the status global
# The y coordinate for the uppermost lane the player can travel on
var top_lane_y_coord: int = 16
# The y coordinate for the lowermost lane the player can travel on
var bottom_lane_y_coord: int = 64
# The height of each lane in pixels
const LANE_HEIGHT: int = 32
# Determins if the player is already moving to a lane
@export var is_moving: bool = false
# The target position for the player to move
var target
# The speed of the player in pixels/sec
@export var speed: int = 8000

# Called when the node enters the scene tree for the first time.
func _ready():
	bottom_lane_y_coord = get_viewport_rect().size.y
	target = Vector2(32, bottom_lane_y_coord / 2)
	
	# Play the first animation
	$AnimatedSprite2D.play("moving")

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
		move_to_y_pos(position.y - LANE_HEIGHT)
	elif event.is_action_pressed("player_down") and not is_moving:
		move_to_y_pos(position.y + LANE_HEIGHT)

# Moves the player to the specified y coordinate or the limits of the lanes if 
#  it would exceed those limits
func move_to_y_pos(y_pos: int):
	is_moving = true
	target = Vector2(position.x, clamp(y_pos, top_lane_y_coord, bottom_lane_y_coord - LANE_HEIGHT))
