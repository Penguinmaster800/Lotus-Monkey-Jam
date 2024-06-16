extends Node2D

signal loading_area_entered

func _ready():
	$Timer.start()

func _on_loading_area_body_entered(_body):
	loading_area_entered.emit()


func _on_timer_timeout():
	queue_free()
