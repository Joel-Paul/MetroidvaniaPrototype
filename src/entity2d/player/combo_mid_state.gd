class_name ComboMidState
extends State

@export var movement: Movement
@export var combo_index: int = 0

func can_enter(prev_state: State) -> bool:
	if prev_state is HeavyComboState:
		if (prev_state as HeavyComboState).animation_index != combo_index:
			return false
	return not entity.is_on_floor()

func can_exit(_next_state: State) -> bool:
	return entity.is_on_floor()

func update(delta: float) -> State:
	movement.update(delta)
	return super(delta)
