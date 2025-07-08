extends ComboStates

@export var gravity: float = 50

func enter(prev_state: State) -> void:
	character.velocity.y = 0
	super(prev_state)

func update(delta: float) -> State:
	controller.process_gravity(gravity, delta)
	return super(delta)
