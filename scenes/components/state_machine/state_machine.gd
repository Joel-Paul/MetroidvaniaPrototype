class_name StateMachine
extends State

@export var init_state: State

@onready var curr_state := init_state

# Overridden built-in virtual methods

func init(character_body: CharacterBody2D, anim_player: AnimationPlayer) -> void:
	super.init(character_body, anim_player)
	for state: State in find_children("*", "State", false):
		state.init(character, animation_player)

# Overridden custom methods

func enter(prev_state: State) -> void:
	curr_state.enter(prev_state)

func exit() -> void:
	curr_state.exit()

func physics_process(delta: float) -> State:
	var next_state = curr_state.physics_process(delta)
	if next_state: change_state(next_state)
	return null

# Remaining methods

func change_state(next_state: State = init_state) -> void:
	if curr_state: curr_state.exit()
	if next_state: next_state.enter(curr_state)
	curr_state = next_state
