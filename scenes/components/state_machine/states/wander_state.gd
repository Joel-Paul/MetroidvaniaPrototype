class_name WanderState
extends State

@export var movement: Movement
@export var move_action: MoveAction

var target: Vector2

func enter(prev_state: State) -> void:
	move_action.input = Vector2(randf(), randf())
	super(prev_state)

func update(delta: float) -> State:
	movement.update(delta)
	return super(delta)
