extends RigidBody2D

var touching = false

func _physics_process(_delta: float) -> void:
	var player = get_parent().get_node("Player")
	if player == null:
		return
	var local = to_local(player.global_position)
	var colliding = local.x > -20 and local.x < 20 and abs(local.y) < 18
	if colliding and not touching:
		var n = Vector2.UP.rotated(global_rotation)
		if local.y > 0:
			n = -n

		var v = player.velocity
		var dir = n
		if v.dot(n) < 0:
			dir = v.bounce(n).normalized()

		player.velocity = dir * (v.length() + 100)

	touching = colliding
