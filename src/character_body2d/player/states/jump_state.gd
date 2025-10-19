extends MovementState

@export var jump_vel: float = 400
@export var jump_action: Action
@export var coyote_timer: Timer

func priority() -> float:
	if not active and can_jump():
		return base_priority
	if active and is_jumping():
		return base_priority
	return 0.0

func enter(_prev: State) -> void:
	jump_action.intercept()
	coyote_timer.stop()
	moveable.velocity.y = -jump_vel
	anim_player.play("rise")

func can_jump() -> bool:
	return jump_action.is_active() and not coyote_timer.is_stopped()

func is_jumping() -> bool:
	return moveable.velocity.y < 0 and jump_action.is_pressed()
