extends State

func enter(_prev_state: State) -> void:
	animation_player.play("")

func exit() -> void:
	pass

func physics_process(_delta: float) -> State:
	return null
