class_name Health
extends Node

signal health_changed(health: int)

@export_range(1, 100, 1, "or_greater") var max_health: int = 1
@export var hurtbox: Hurtbox

@onready var health = max_health

func _ready() -> void:
	hurtbox.attacked.connect(_on_attacked)

func _on_attacked(attack: Attack) -> void:
	health -= attack.damage
	health_changed.emit(health)
	print("Health: {0}. Received {1} damage!".format([health, attack.damage]))
