class_name StateMachine
extends Node

signal changed_state(state: State)

@export var entity: Entity2D
@export var animation_player: AnimationPlayer
@export var init_state: State

@export_group("Exported for AnimationPlayer")
@export var lock_state: bool = false

var curr_state: State

func init() -> void:
	lock_state = false
	for state: State in find_children("*", "State"):
		state.init(entity, animation_player)
	change_state(init_state)

func update(delta: float) -> void:
	if not curr_state: return
	var next_state: State = curr_state.update(delta)
	if not lock_state:
		entity.flip()
		if next_state: change_state(next_state)

func change_state(next_state: State) -> void:
	if curr_state: curr_state.exit(next_state)
	if next_state:
		next_state.enter(curr_state)
		changed_state.emit(next_state)
	curr_state = next_state
