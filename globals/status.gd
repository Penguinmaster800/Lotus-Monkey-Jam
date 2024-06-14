extends Node
#emits signal intended for UI to update whenever needed
signal stat_change

#variables of  player stats
var lives_amount: int = 5:
	set(value):
		lives_amount = value
		stat_change.emit()


var stamina: int = 100:
	set(value):
		stamina = value
		stat_change.emit()
