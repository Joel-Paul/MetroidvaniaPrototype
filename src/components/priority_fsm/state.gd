@abstract
class_name State
extends Node

@export var base_priority: float = 50
@export var next_states: Array[State]

var body2d: CharacterBody2D
var player: AnimationPlayer
var active = false

var _init := false

func init(character_body2d: CharacterBody2D, animation_player: AnimationPlayer) -> void:
	if _init:
		return
	_init = true
	body2d = character_body2d
	player = animation_player
	for state in self.next_states:
		state.init(character_body2d, animation_player)

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
