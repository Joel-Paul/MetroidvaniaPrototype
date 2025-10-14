class_name Moveable
extends Node

var velocity := Vector2.ZERO
var direction := Vector2.ZERO

func update(stats: MoveStats, delta: float):
	var acc: float = stats.acceleration if has_direction() else stats.deceleration
	velocity = velocity.move_toward(stats.speed * direction, acc * delta)

func has_direction() -> bool:
	return direction != Vector2.ZERO
