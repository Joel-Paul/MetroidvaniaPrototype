extends State

@export var movement: Movement

func can_enter(_prev_state: State) -> bool:
	return entity.is_on_floor()

func can_exit(next_state: State) -> bool:
	if next_state is IdleState:
		return not animation_player.is_playing()
	return super(next_state)

func update(delta: float) -> State:
	movement.update(delta)
	return super(delta)
