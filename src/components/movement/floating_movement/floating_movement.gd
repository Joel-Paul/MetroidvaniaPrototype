class_name FloatingMovement
extends Movement

@export var max_speed: float = 0
@export var acceleration: float = 0
@export var deceleration: float = 0

func update(delta: float) -> void:
	var acc: float = acceleration if entity.has_input() else deceleration
	if absf(entity.velocity.x) > max_speed:
		acc = deceleration if entity.has_input() else acceleration
	acc *= delta
	entity.velocity.x = move_toward(entity.velocity.x, max_speed * entity.input.x, acc)
	entity.velocity.y = move_toward(entity.velocity.y, max_speed * entity.input.y, acc)
