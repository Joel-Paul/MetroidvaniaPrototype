class_name Health
extends Node

signal health_changed(delta: int)

@export_range(1, 100, 1, "or_greater") var max_health: int = 1
@export var hurtbox: Hurtbox

@onready var cur_health = max_health

func _ready() -> void:
	hurtbox.attacked.connect(_on_attacked)

func _on_attacked(attack: Attack) -> void:
	cur_health -= attack.damage
	health_changed.emit(-attack.damage)
	print(get_parent(), " ", cur_health, ", ", -attack.damage, ", ", attack.knockback)
