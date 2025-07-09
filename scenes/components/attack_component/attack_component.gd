class_name AttackComponent
extends Node

@export var buffer_time: float = 0.3

func request_attack(time: float = buffer_time) -> void:
	%AttackBuffer.start(time)

func reset_buffer() -> void:
	%AttackBuffer.stop()

func attack_requested() -> bool:
	return not $AttackBuffer.is_stopped()
