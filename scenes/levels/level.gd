extends Node2D
class_name LevelParent

# The speed at which the level moves in pixels/sec
@export var move_speed: int = 20
# The length of the level in pixels
@export var level_length: int = 10000
# The target coordinates that the level whill move towards
var target: Vector2

func _spawn_area(selected_arrangement):
	var loaded_area = selected_arrangement.instantiate() as Area2D
	print(selected_arrangement)

func _ready():
	# Set the target for the level to be far to the left so it appears like the
	#  the player is moving to the right
	target = Vector2(position.x - level_length, position.y)

func _process(delta):
	# Steadily move the level to the left
	position = position.move_toward(target, delta * move_speed)
