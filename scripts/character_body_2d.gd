extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var dir = 1
var dashcooldown = 0
var last_velocity = 0

func _process(delta: float) -> void:
	if global_position.y > 500:
		var end = get_parent().get_node("deathscene")
		hide()
		end.visible = true
		await get_tree().create_timer(2).timeout
		get_tree().reload_current_scene.call_deferred()

func _physics_process(delta: float) -> void:
	if velocity.x != 0:
		dir = sign(velocity.x)
	if dashcooldown > 0:
		dashcooldown -= delta

	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle dash.
	print(dir)
	if Input.is_action_just_pressed("dash") && dashcooldown <= 0:
		velocity.y = 0
		last_velocity = velocity.x
		velocity.x += dir * 600
		await get_tree().create_timer(0.1).timeout
		velocity.x -= last_velocity
		dashcooldown = 0.5

	move_and_slide()
