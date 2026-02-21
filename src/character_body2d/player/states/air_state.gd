extends MovementState

@export var character: CharacterBody2D

func priority() -> float:
	return 0.0 if character.is_on_floor() else base_priority

func update(delta: float) -> void:
	super(delta)
	
	if moveable.velocity.y < 0:
		anim_player.play("rise")
	else:
		anim_player.play("fall")
