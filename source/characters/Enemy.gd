extends Character


func _ready():  # run when this node is initialized (after each of its children are ready)
	set_physics_process(false)
	_velocity.x = -speed.x


func _on_stomped(body):
	if body.global_position.y > get_node("playerDetect").global_position.y:
		return
	get_node("playerDetect/playerCollide").disabled = true
	queue_free()


func _physics_process(delta):
	_velocity.y += gravity * delta
	if is_on_wall():
		_velocity.x *= -1.0
	
	_velocity.y = move_and_slide(_velocity, FLOOR_NORMAL).y

