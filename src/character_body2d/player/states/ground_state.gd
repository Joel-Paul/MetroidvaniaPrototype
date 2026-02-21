extends MovementState

@export var character: CharacterBody2D

func priority() -> float:
	return base_priority if character.is_on_floor() else 1.0

func update(delta: float) -> void:
	super(delta)
	if absf(moveable.velocity.x) == 0:
		anim_player.play("idle")
	else:
		anim_player.play("run")
