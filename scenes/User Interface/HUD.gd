extends CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready():
	Status.stat_change.connect(_on_status_stat_change)
	Status.progress_change.connect(_on_progress_change)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_status_stat_change():
	$Stamina/ProgressBar.value = Status.stamina

func _on_progress_change():
	$LevelProgress/ProgressBar.value = 10 - Status.progress
