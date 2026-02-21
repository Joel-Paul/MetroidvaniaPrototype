extends AttackState

@export var character: CharacterBody2D

func priority() -> float:
	if active and anim_player.is_playing():
		return base_priority
	if not active and character.is_on_floor():
		return base_priority
	return 0
