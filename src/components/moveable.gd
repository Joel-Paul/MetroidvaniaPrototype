class_name Moveable
extends Node

var velocity := Vector2.ZERO
var direction := Vector2.ZERO

func update(stats: MoveStats, delta: float):
	velocity += stats.gravity * delta
	var acc: Vector2 = stats.acceleration if has_direction() else stats.deceleration
	velocity.x = move_toward(velocity.x, stats.speed.x * direction.x, acc.x * delta)
	velocity.y = move_toward(velocity.y, stats.speed.y * direction.y, acc.y * delta)

func has_direction() -> bool:
	return direction != Vector2.ZERO
