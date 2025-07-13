extends ComboState

func can_enter(_prev_state: State) -> bool:
	return action.is_active() and not entity.is_on_floor()

func update(delta: float) -> State:
	entity.velocity.y = 0
	return super(delta)
