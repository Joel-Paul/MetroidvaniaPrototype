class_name Hitbox
extends Area2D

@export var node2d: Node2D
@export var attack: Attack

func _ready() -> void:
	area_entered.connect(hit)

func hit(hurtbox: Hurtbox) -> void:
	attack.source = node2d.position
	hurtbox.hurt(attack)
