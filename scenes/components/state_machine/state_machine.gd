class_name StateMachine
extends Node

@export var character: CharacterBody2D
@export var animation_player: AnimationPlayer
@export var init_state: State

@export var move_action: MoveAction
@export var flip_component: FlipComponent

@export_group("Exported for AnimationPlayer")
@export var lock_state: bool = false

var curr_state: State

func init() -> void:
	lock_state = false
	for state: State in find_children("*", "State"):
		state.init(character, animation_player)
	change_state(init_state)

func update(delta: float) -> void:
	var next_state = curr_state.update(delta)
	if not lock_state:
		flip_component.flip(move_action.x)
		if next_state: change_state(next_state)

func change_state(next_state: State) -> void:
	if curr_state: curr_state.exit(next_state)
	if next_state: next_state.enter(curr_state)
	curr_state = next_state
