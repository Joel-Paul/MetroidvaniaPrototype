extends MovementState

@export var parent: StateMachine
@export var action: Action

var index: int = 0

func priority() -> float:
	if action.is_active():
		return base_priority
	return 0

func enter(_prev: State) -> void:
	parent.dirty = true
	action.intercept()

func get_next() -> State:
	var curr: State = self.next_states[index]
	index = (index + 1) % self.next_states.size()
	return curr
