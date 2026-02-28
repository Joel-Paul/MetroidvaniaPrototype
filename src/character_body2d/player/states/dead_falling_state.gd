extends MovementState

@export var character: CharacterBody2D
@export var health: Health

func priority() -> float:
	return base_priority if health.is_dead() and not character.is_on_floor() else 0.0

func enter(_prev: State) -> void:
	anim_player.play("death_falling")
