extends CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready():
	Status.stat_change.connect(_on_status_stat_change)
	Status.progress_change.connect(_on_progress_change)

func _on_status_stat_change():
	$Stamina/ProgressBar.value = 5 / Status.lives * 100

func _on_progress_change():
	$LevelProgress/ProgressBar.value = 10 - Status.progress
