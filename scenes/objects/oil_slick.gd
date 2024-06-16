extends Area2D

var drain_stamina: bool = false
var stamina_drain_rate: float = 0.0

# Called when the node enters the scene tree for the first time.
func _ready():
	stamina_drain_rate = 1.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if drain_stamina:
		Status.stamina = clampi(Status.stamina - stamina_drain_rate, 0, 100)

#func _input(event):
	#if (event.is_action_pressed("debug_oil_slick")):
	#	drain_stamina = not drain_stamina

func _on_body_entered(body):
	drain_stamina = true

func _on_body_exited(body):
	drain_stamina = false
