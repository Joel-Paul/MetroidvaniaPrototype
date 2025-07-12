extends State

@export var max_idle: float = 1

var timer: Timer

func enter(_prev_state: State) -> void:
	timer = Timer.new()
	timer.process_callback = Timer.TIMER_PROCESS_PHYSICS
	timer.one_shot = true
	add_child(timer)
	timer.start(randf() * max_idle)

func can_exit(next_state: State) -> bool:
	if next_state is WanderState:
		return timer.is_stopped()
	return super(next_state)
