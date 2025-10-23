class_name Hitbox
extends Area2D

@export var character: CharacterBody2D
@export var attack: Attack

func _ready() -> void:
	area_entered.connect(hit)

func hit(hurtbox: Hurtbox) -> void:
	attack.source = character.position
	hurtbox.hurt(attack)
