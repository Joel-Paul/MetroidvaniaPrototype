extends ComboState

func enter(prev_state: State) -> void:
	character.velocity.y = 0
	super(prev_state)
