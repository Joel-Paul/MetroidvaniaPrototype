class_name Hitbox
extends Area2D

@export var character: CharacterBody2D
@export var attack: Attack

func _ready() -> void:
	area_entered.connect(_on_area_entered)

func _on_area_entered(hurtbox: Hurtbox) -> void:
	attack.source = character.position
	hurtbox.hurt(attack)
