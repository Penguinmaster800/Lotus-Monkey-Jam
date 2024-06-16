extends Node
#emits signal intended for UI to update whenever needed
signal stat_change
signal progress_change
signal speed_change
signal time_change

#variables of  player stats
var lives: int = 5:
	set(value):
		lives = value
		stat_change.emit()

var stamina: int = 100:
	set(value):
		stamina = value
		stat_change.emit()

var progress: int = 10:
	set(value):
		progress = value
		progress_change.emit()
		stat_change.emit()

#current area for spawn list
var current_area = 1

var speed = 150:
	set(value):
		speed = value
		speed_change.emit()

var time_remaining = 70:
	set(value):
		time_remaining = value
		time_change.emit()
