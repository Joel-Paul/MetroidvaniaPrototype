extends State

@export var movement: Movement

func can_enter(_prev_state: State) -> bool:
	return not entity.is_on_floor() and entity.velocity.y >= 0

func update(delta: float) -> State:
	movement.update(delta)
	return super(delta)
