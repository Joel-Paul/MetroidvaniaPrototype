class_name RunState
extends State

@export var idle_state: IdleState
@export var jump_state: JumpState

@export var max_speed: float = 150
@export var acceleration: float = 20
@export var deceleration: float = 20

func enter(_prev_state: State) -> void:
	animation_player.play("run")

func exit() -> void:
	pass

func physics_process(_delta: float) -> State:
	if Input.is_action_just_pressed("jump"):
		return jump_state
	
	var input := Input.get_axis("left", "right")
	var acc := deceleration if input == 0 else acceleration
	character.velocity.x = move_toward(character.velocity.x, input * max_speed, acc)
	
	if character.velocity.x == 0:
		return idle_state
	return null
