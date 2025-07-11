extends State

@export var platformer_movement: PlatformerMovement
@export var jump_action: InputBuffer
@export var jump: float = 300
@export var coyote_timer: Timer

func can_enter(_prev_state: State) -> bool:
	return not coyote_timer.is_stopped() and jump_action.is_active()

func enter(prev_state: State) -> void:
	jump_action.stop()
	coyote_timer.stop()
	character.velocity.y = -jump
	super(prev_state)

func update(delta: float) -> State:
	if jump_action.is_released():
		character.velocity.y *= 0.5
	platformer_movement.update(delta)
	return super(delta)
