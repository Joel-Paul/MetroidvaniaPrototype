extends AttackState

func priority() -> float:
	if active and anim_player.is_playing():
		return base_priority
	if not active and body2d.is_on_floor():
		return base_priority
	return 0
