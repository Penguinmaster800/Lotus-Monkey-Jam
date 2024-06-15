extends Node2D

signal loading_area_entered

func _on_loading_area_body_entered(_body):
	loading_area_entered.emit()
	print("player entered")
