class_name ComboEndState
extends State

@export var movement: Movement
@export var combo_timer: Timer
@export var combo_index: int = 0

func can_enter(prev_state: State) -> bool:
	if prev_state is HeavyComboState:
		if (prev_state as HeavyComboState).animation_index != combo_index:
			return false
	elif prev_state is ComboMidState:
		if (prev_state as ComboMidState).combo_index != combo_index:
			return false
	return entity.is_on_floor()

func can_exit(next_state: State) -> bool:
	if next_state is IdleState:
		return not animation_player.is_playing()
	return super(next_state)

func exit(next_state: State) -> void:
	combo_timer.paused = false
	combo_timer.start()
	super(next_state)

func update(delta: float) -> State:
	movement.update(delta)
	return super(delta)
