class_name Controller
extends Node

signal flip(input: float)

@export var character: CharacterBody2D

var input: float
var _facing: int = 1

## deceleration should always be less than acceleration
func process_movement(speed: float, acceleration: float, deceleration: float, _delta: float, can_flip: bool = true) -> void:
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

func move_facing(speed: float) -> void:
	character.velocity.x = speed * _facing

func process_flip() -> void:
	if input != 0: _facing = signi(int(input))
	flip.emit(input)
