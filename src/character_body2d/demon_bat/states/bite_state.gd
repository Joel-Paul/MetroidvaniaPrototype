extends AttackState

@export var bite_range: Area2D

func priority() -> float:
	if active and anim_player.is_playing():
		return base_priority
	if not active and bite_range.has_overlapping_areas():
		return base_priority * 1.1
	return 0
