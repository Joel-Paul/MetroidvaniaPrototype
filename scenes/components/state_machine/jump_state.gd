class_name JumpState
extends State

@export var idle_state: IdleState
@export var rise_state: RiseState

@export var jump: float = 300

func enter(_prev_state: State) -> void:
	animation_player.play("jump")
	character.velocity.y -= jump

func exit() -> void:
	pass

func physics_process(_delta: float) -> State:
	if character.is_on_floor(): return idle_state
	return null
