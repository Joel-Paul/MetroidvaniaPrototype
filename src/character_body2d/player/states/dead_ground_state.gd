extends MovementState

@export var health: Health

func priority() -> float:
	return base_priority if health.is_dead() else 0.0

func enter(_prev: State) -> void:
	anim_player.play("death_ground")
