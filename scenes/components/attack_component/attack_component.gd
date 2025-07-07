class_name AttackComponent
extends Node

@export var buffer_time: float = 0.2
@export var animation_locked = false

func update(_delta: float) -> void:
	if Input.is_action_just_pressed("attack"): %InputBuffer.start(buffer_time)

func can_attack() -> bool:
	return not %InputBuffer.is_stopped() and not animation_locked
