class_name FallState
extends State

@export var rise_state: RiseState

@export var max_speed: float = 150
@export var acceleration: float = 20
@export var deceleration: float = 5

func enter(_prev_state: State) -> void:
	animation_player.play("fall")

func exit() -> void:
	pass

func physics_process(delta: float) -> State:
	var input := Input.get_axis("left", "right")
	var acc := deceleration if input == 0 else acceleration
	character.velocity.x = move_toward(character.velocity.x, input * max_speed, acc)
	
	character.velocity += character.get_gravity() * delta
	if character.velocity.y < 0:
		return rise_state
	return null
