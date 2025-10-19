extends MovementState

@export var animation_name: StringName

func priority() -> float:
	if anim_player.is_playing():
		return base_priority
	return 0

func enter(_prev: State) -> void:
	anim_player.play(animation_name)

func update(delta: float) -> void:
	moveable.update(move_stats, delta)
