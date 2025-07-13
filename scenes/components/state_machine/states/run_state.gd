extends State

@export var movement: Movement

func can_enter(_prev_state: State) -> bool:
	return entity.is_on_floor() and (entity.velocity.x != 0 or entity.has_input())

func update(delta: float) -> State:
	movement.update(delta)
	return super(delta)
