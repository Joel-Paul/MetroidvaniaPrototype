class_name FloatingMovement
extends Movement

@export var max_speed: float = 0
@export var acceleration: float = 0
@export var deceleration: float = 0

func update(_delta: float) -> void:
	var acc: float = acceleration if move_action.has_input() else deceleration
	if absf(character.velocity.x) > max_speed:
		acc = deceleration if move_action.has_input() else acceleration
	character.velocity.x = move_toward(character.velocity.x, max_speed * move_action.x, acc)
	character.velocity.y = move_toward(character.velocity.y, max_speed * move_action.y, acc)
