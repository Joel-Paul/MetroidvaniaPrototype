class_name Hitbox
extends Area2D
## Used to designate attack region.
##
## Will trigger [method hit] when coming into contact with a [Hurtbox].
## Attack properties are determined using the [Attack] class.

@export var source: Node2D
@export var attack: Attack

func _ready() -> void:
	area_entered.connect(hit)
	monitorable = false

func hit(hurtbox: Hurtbox) -> void:
	attack.source = source.position
	hurtbox.hurt(attack)
