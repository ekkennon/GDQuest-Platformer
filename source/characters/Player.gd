extends Character


export var stomp_impulse: = 1000.0


func _on_enemyDetect_area_entered(area):
	_velocity = calc_stomp_velocity(_velocity, stomp_impulse)


func _on_enemyDetect_body_entered(body):
	queue_free()


func _physics_process(_delta):  # runs every frame
	var is_jump_interrupted: = Input.is_action_just_released("jump") and _velocity.y < 0.0
	var direction: = get_direction()
	_velocity = calc_move_velocity(_velocity, direction, speed, is_jump_interrupted)
	_velocity.y = min(_velocity.y, speed.y)
	_velocity = move_and_slide(_velocity, FLOOR_NORMAL)


func get_direction() -> Vector2:
	return Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		-1.0 if Input.is_action_just_pressed("jump") and is_on_floor() else 0.0
	)


func calc_move_velocity(vel: Vector2, direction: Vector2, speed: Vector2, is_jump_interrupted: bool) -> Vector2:
	var v = vel
	v.x = speed.x * direction.x
	v.y += gravity * get_physics_process_delta_time()  # this appears to not be in the final version
	if direction.y == -1.0:
		v.y = speed.y * direction.y
	if is_jump_interrupted:
		v.y = 0.0
	return v


func calc_stomp_velocity(vel, stomp) -> Vector2:
	var v = vel
	v.y = -stomp
	return v

