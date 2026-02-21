@abstract
class_name State
extends Node
## State to be used by a [StateMachine].
##
## All possible transitions are stored in [member next_states].
## States with a higher [method priority] than this one will be transitioned to.

@export var base_priority: float = 50
@export var next_states: Array[State]

var anim_player: AnimationPlayer
var active = false

var _init := false

func init(animation_player: AnimationPlayer) -> void:
	if _init:
		return
	_init = true
	anim_player = animation_player
	for state in self.next_states:
		state.init(animation_player)

func priority() -> float:
	return base_priority

func enter(_prev: State) -> void:
	pass

func update(_delta: float) -> void:
	pass

func exit(_next: State) -> void:
	pass

func get_next() -> State:
	var next := self
	for state in next_states:
		if next.priority() < state.priority():
			next = state
	return next
