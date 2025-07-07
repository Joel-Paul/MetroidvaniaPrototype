class_name Controller
extends Node

signal flip(input: float)

@export var character: CharacterBody2D
var facing: int = 1

## deceleration should always be less than acceleration
func process_movement(speed: float, acceleration: float, deceleration: float, _delta: float, can_flip: bool = true) -> void:
	var input := Input.get_axis("left", "right")
	if can_flip: process_flip()
	
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

func move_facing(speed: float) -> void:
	character.velocity.x += speed * facing

func process_flip() -> void:
	var input := Input.get_axis("left", "right")
	if input != 0: facing = signi(int(input))
	flip.emit(input)
