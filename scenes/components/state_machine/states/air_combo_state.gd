extends ComboState

func can_enter(_prev_state: State) -> bool:
	return action.is_active() and not character.is_on_floor()

func update(delta: float) -> State:
	character.velocity.y = 0
	return super(delta)
