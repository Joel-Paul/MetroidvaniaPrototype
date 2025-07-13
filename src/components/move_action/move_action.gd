class_name MoveAction
extends Node

var input: Vector2 = Vector2.ZERO

var x: float:
	set(value):
		input.x = value
	get:
		return input.x

var y: float:
	set(value):
		input.y = value
	get:
		return input.y

func has_input() -> bool:
	return input != Vector2.ZERO
