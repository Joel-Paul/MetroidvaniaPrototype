class_name AttackState
extends MovementState

@export var animation_name: StringName

var chain_buffer: Timer

func priority() -> float:
	if active and anim_player.is_playing():
		return base_priority
	if not active:
		return base_priority
	return 0

func enter(_prev: State) -> void:
	anim_player.play(animation_name)

func update(delta: float) -> void:
	moveable.update(move_stats, delta)
	if chain_buffer:
		chain_buffer.start()
