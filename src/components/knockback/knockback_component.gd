class_name Knockback
extends Node

@export var character: CharacterBody2D
@export var hurtbox: Hurtbox

func _ready() -> void:
	hurtbox.attacked.connect(_on_attacked)

func _on_attacked(attack: Attack) -> void:
	var direction: Vector2 = attack.source.direction_to(character.position)
	character.velocity = direction * attack.knockback
