class_name IdleState
extends State

@export var run_state: RunState
@export var jump_state: JumpState

func enter(_prev_state: State) -> void:
	animation_player.play("idle")

func exit() -> void:
	pass

func physics_process(_delta: float) -> State:
	if Input.is_action_just_pressed("jump"):
		return jump_state
	if Input.get_axis("left", "right") != 0 or character.velocity.x != 0:
		return run_state
	return null
