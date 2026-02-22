class_name Hurtbox
extends Area2D
## Used to designate the region a character can be hurt.
##
## This area can be detected using a [Hitbox]. 

signal attacked(attack: Attack)

func _ready() -> void:
	monitoring = false

func hurt(attack: Attack) -> void:
	attacked.emit(attack)
