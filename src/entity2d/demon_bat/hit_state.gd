extends State

@export var movement: Movement

func can_exit(_next_state: State) -> bool:
	return not animation_player.is_playing()

func update(delta: float) -> State:
	movement.update(delta)
	return super(delta)
