extends Panel


var time = Status.time_remaining
var minutes: int = 0
var seconds: int = 0
var msec: int = 0

func _process(delta):
	time = Status.time_remaining
	time -= delta
	Status.time_remaining = time
	msec = fmod(time, 1) * 1000
	seconds = fmod(time, 60)
	minutes = fmod(time, 3600) / 60
	$Minute.text = "%02d:" % minutes
	$Second.text = "%02d." % seconds
	$Millisecond.text = "%03d" % msec
