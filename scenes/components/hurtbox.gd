class_name HurtBox
extends Area2D

@export var disabled: bool = true:
	set(value):
		disabled = value
		for shape: CollisionShape2D in find_children("*", "CollisionShape2D"):
			shape.disabled = value
