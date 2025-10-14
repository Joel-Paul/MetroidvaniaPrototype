class_name Hurtbox
extends Area2D

signal attacked(attack: Attack)

func hurt(attack: Attack) -> void:
	attacked.emit(attack)
