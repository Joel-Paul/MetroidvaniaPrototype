class_name Controller
extends Node

signal flip(input: float)

@export var character: CharacterBody2D

## deceleration should always be less than acceleration
func process_movement(speed: float, acceleration: float, deceleration: float, _delta: float) -> void:
	var input := Input.get_axis("left", "right")
	flip.emit(input)
	
	# Player input should result in the fastest motion, so it should slow down
	# the least and speed up the most to target speed when input is pressed
	var acc: float
	if absf(character.velocity.x) > speed:
		acc = acceleration if input == 0 else deceleration
	else:
		acc = deceleration if input == 0 else acceleration
	character.velocity.x = move_toward(character.velocity.x, speed * input, acc)

func process_gravity(gravity: float, delta) -> void:
	character.velocity.y += gravity * delta

func can_jump() -> bool:
	return character.is_on_floor()
