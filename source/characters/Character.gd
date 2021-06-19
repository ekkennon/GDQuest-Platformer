extends KinematicBody2D
class_name Character

const FLOOR_NORMAL: = Vector2.UP
export var speed: = Vector2(300.0, 1000.0)
export var gravity: = 4000.0
var _velocity: = Vector2.ZERO

func _physics_process(_delta):  # runs each frame
	#_velocity.y += gravity * delta
	pass
