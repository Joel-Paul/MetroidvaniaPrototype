extends State

func can_enter(_prev_state: State) -> bool:
	return true

func update(delta: float) -> State:
	return super(delta)
