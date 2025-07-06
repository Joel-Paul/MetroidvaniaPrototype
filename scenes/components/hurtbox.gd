class_name HurtBox
extends Area2D

@export var active := false

func _ready() -> void:
	set_disabled(!active)

func set_disabled(disabled: bool):
	for child in get_children():
		if child is CollisionShape2D:
			(child as CollisionShape2D).disabled = disabled
