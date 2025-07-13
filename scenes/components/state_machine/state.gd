class_name State
extends Node

@export var animation_name: StringName
@export var transition_states: Array[State]

var entity: Entity2D
var animation_player: AnimationPlayer

@warning_ignore("shadowed_variable")
func init(entity: Entity2D, animation_player: AnimationPlayer) -> void:
	self.entity = entity
	self.animation_player = animation_player

func can_enter(_prev_state: State) -> bool:
	return true

func enter(_prev_state: State) -> void:
	animation_player.play(animation_name)

func can_exit(_next_state: State) -> bool:
	return true

func exit(_next_state: State) -> void:
	pass

func update(_delta: float) -> State:
	for state in transition_states:
		if can_exit(state) and state.can_enter(self): return state
	return null

func _create_timer() -> Timer:
	var timer = Timer.new()
	add_child(timer)
	timer.process_callback = Timer.TIMER_PROCESS_PHYSICS
	timer.one_shot = true
	return timer
