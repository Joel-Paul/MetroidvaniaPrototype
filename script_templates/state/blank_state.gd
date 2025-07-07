extends State

func can_enter(_prev_state: State) -> bool:
	return true

func enter(_prev_state: State) -> void:
	animation_player.play()

func update(delta: float) -> State:
	return super(delta)
