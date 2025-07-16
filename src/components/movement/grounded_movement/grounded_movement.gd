class_name GroundedMovement
extends Movement

@export_range(0, 1000, 1.0, "or_greater", "suffix:px/s") var max_speed: float = 0
@export_range(0, 1000, 1.0, "or_greater", "suffix:px/s²") var acceleration: float = 0
@export_range(0, 1000, 1.0, "or_greater", "suffix:px/s²") var deceleration: float = 0
@export_range(0, 1000, 1.0, "or_greater", "suffix:px/s²") var gravity: float = 980

func update(delta: float) -> void:
	var acc: float = acceleration if entity.has_input() else deceleration
	if absf(entity.velocity.x) > max_speed:
		acc = deceleration if entity.has_input() else acceleration
	acc *= delta
	entity.velocity.x = move_toward(entity.velocity.x, max_speed * entity.input.x, acc)
	entity.velocity.y += gravity * delta
