class_name ComboState
extends MovementState
## State to manage a chain of [AttackState] states.
##
## Unlike a regular [State] which determines the next state based on [method priority],
## this state will cycle through its children sequentially each time it is run.
## The sequence resets once [member chain_buffer] times out.

@export var state_machine: StateMachine
@export var action: Action
@export var chain_buffer: Timer

var index: int = 0

func _ready() -> void:
	chain_buffer.timeout.connect(_timeout)

func init(character_body2d: CharacterBody2D, animation_player: AnimationPlayer) -> void:
	if _init:
		return
	for state in self.next_states:
		if state is AttackState:
			var attack := state as AttackState
			attack.chain_buffer = chain_buffer
	super(character_body2d, animation_player)

func priority() -> float:
	if action.is_active():
		return base_priority
	return 0

func enter(_prev: State) -> void:
	# Set the state machine to dirty so the next state can immedietely be transitioned to.
	# This prevents spending a frame on this state, which has no other functionality.
	state_machine.dirty = true
	action.intercept()

## Get the next state in sequence.
func get_next() -> State:
	var curr: State = self.next_states[index]
	index = (index + 1) % self.next_states.size()
	return curr

## Resets the sequence.
func _timeout() -> void:
	index = 0
