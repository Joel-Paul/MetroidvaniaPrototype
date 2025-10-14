extends MovementState

func priority() -> float:
	return 0.0 if body2d.is_on_floor() else base_priority

func update(delta: float) -> void:
	moveable.update(move_stats, delta)
	
	if moveable.velocity.y < 0:
		player.play("rise")
	else:
		player.play("fall")
	if moveable.direction.x != 0:
		flippable.flip = moveable.direction.x < 0
