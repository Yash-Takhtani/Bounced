extends Area2D

func _on_body_entered(body: Node2D) -> void:
	print(body)
	if body.name == "Player":
		get_tree().reload_current_scene.call_deferred()
