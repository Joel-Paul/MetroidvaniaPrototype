class_name FloorStates
extends StateMachine

@export var idle_state: IdleState
@export var run_state: RunState

@export var air_states: AirStates

func enter(prev_state: State) -> void:
	if character.velocity.x == 0:
		curr_state = idle_state
	else:
		curr_state = run_state
	super.enter(prev_state)

func physics_process(delta: float) -> State:
	super.physics_process(delta)
	if not character.is_on_floor():
		return air_states
	return null
