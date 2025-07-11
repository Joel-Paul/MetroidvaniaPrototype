extends State

@export var jump_action: ActionBuffer
@export var jump: float = 300
@export var coyote_timer: Timer

func can_enter(_prev_state: State) -> bool:
	return not coyote_timer.is_stopped() and jump_action.is_active()

func enter(prev_state: State) -> void:
	character.velocity.y = -jump
	coyote_timer.stop()
	super(prev_state)
