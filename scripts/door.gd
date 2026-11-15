extends Area2D

var touching = false

func _physics_process(_delta: float) -> void:
	var player = get_parent().get_node("Player")
	var win = get_parent().get_node("winscene")
	
	if player == null:
		return
	var local = to_local(player.global_position)
	var colliding = local.x > -28 and local.x < 28 and abs(local.y) < 36
	if colliding and not touching:
		print("You win!")
		win.visible = true
		get_parent().hide_everything()
		await get_tree().create_timer(1).timeout
		get_tree().reload_current_scene.call_deferred()
	touching = colliding
