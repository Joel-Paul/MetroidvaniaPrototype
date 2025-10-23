class_name Moveable
extends Node

@export var flippable: Flippable

var velocity := Vector2.ZERO
var direction := Vector2.ZERO

func update(stats: MoveStats, delta: float):
	var acc: Vector2
	acc.x = stats.acceleration.x if direction.x else stats.deceleration.x
	acc.y = stats.acceleration.y if direction.y else stats.deceleration.y
	velocity.x = move_toward(velocity.x, stats.speed.x * direction.x, acc.x * delta)
	velocity.y = move_toward(velocity.y, stats.speed.y * direction.y, acc.y * delta)

func add_velocity_facing(vel: Vector2):
	velocity += vel * flippable.get_facing()
