class_name AirStates
extends StateMachine

@export var floor_states: FloorStates

func physics_process(delta: float) -> State:
	super.physics_process(delta)
	if character.is_on_floor():
		return floor_states
	return null
