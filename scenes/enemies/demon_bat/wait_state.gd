class_name WaitState
extends State

@export var min_wait_time: float = 1
@export var max_wait_time: float = 1

@onready var timer: Timer = _create_timer()

func enter(_prev_state: State) -> void:
	entity.velocity = Vector2.ZERO
	timer.start(randf_range(min_wait_time, max_wait_time))

func can_exit(next_state: State) -> bool:
	if next_state is WanderState:
		return timer.is_stopped()
	return super(next_state)
