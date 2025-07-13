class_name IdleState
extends State

func can_enter(_prev_state: State) -> bool:
	return entity.is_on_floor() and entity.velocity.x == 0
