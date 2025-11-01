class_name Moveable
extends Node

@export var flippable: Flippable

var velocity := Vector2.ZERO
var direction := Vector2.ZERO

func update(stats: MoveStats, delta: float) -> void:
	var acc: Vector2
	acc.x = stats.acceleration.x if direction.x else stats.deceleration.x
	acc.y = stats.acceleration.y if direction.y else stats.deceleration.y
	velocity.x = move_toward(velocity.x, stats.speed.x * direction.x, acc.x * delta)
	velocity.y = move_toward(velocity.y, stats.speed.y * direction.y, acc.y * delta)

func add_velocity_facing(vel: Vector2, input_required: bool = false) -> void:
	if input_required and direction.x != flippable.get_facing():
		return
	velocity += vel * Vector2(flippable.get_facing(), 1)

func add_speed_in_direction(speed: float) -> void:
	velocity += speed * direction
