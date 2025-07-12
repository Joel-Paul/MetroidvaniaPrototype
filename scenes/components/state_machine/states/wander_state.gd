class_name WanderState
extends State

@export var movement: Movement
@export var move_action: MoveAction
@export var min_wander_time: float = 1
@export var max_wander_time: float = 1

@onready var timer: Timer = _create_timer()

func enter(prev_state: State) -> void:
	move_action.input = Vector2.RIGHT.rotated(randf() * 2 * PI)
	timer.start(randf_range(min_wander_time, max_wander_time))
	super(prev_state)

func can_exit(next_state: State) -> bool:
	if next_state is WaitState:
		return timer.is_stopped()
	return super(next_state)

func update(delta: float) -> State:
	movement.update(delta)
	return super(delta)
