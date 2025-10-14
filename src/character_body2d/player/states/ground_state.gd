extends MovementState

func priority() -> float:
	return base_priority if body2d.is_on_floor() else 1.0

func update(delta: float) -> void:
	moveable.update(move_stats, delta)
	
	if absf(moveable.velocity.x) == 0:
		player.play("idle")
	else:
		player.play("run")
	if moveable.direction.x != 0:
		flippable.flip = moveable.direction.x < 0
