class_name StateMachine
extends Node

@export var character: CharacterBody2D
@export var animation_player: AnimationPlayer
@export var controller: Controller
@export var init_state: State

var curr_state: State

func init() -> void:
	for state: State in find_children("*", "State"):
		state.init(character, animation_player, controller)
	change_state(init_state)

func update(delta: float) -> void:
	var next_state = curr_state.update(delta)
	if next_state: change_state(next_state)

func change_state(next_state: State) -> void:
	if curr_state: curr_state.exit(next_state)
	if next_state: next_state.enter(curr_state)
	curr_state = next_state
