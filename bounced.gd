extends Node2D

func hide_everything() -> void:
	for child in get_children():
		if child is CanvasLayer:
			continue
		if child is CanvasItem:
			child.hide()
