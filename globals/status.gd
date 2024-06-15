extends Node
#emits signal intended for UI to update whenever needed
signal stat_change

#variables of  player stats
var lives: int = 5:
	set(value):
		lives = value
		stat_change.emit()


var stamina: int = 100:
	set(value):
		stamina = value
		stat_change.emit()

#current area for spawn list
var current_area = [1,2,3]
