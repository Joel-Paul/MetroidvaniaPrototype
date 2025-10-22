extends MovementState

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
	state_machine.dirty = true
	action.intercept()

func get_next() -> State:
	var curr: State = self.next_states[index]
	index = (index + 1) % self.next_states.size()
	return curr

func _timeout() -> void:
	index = 0
	print("TA")
