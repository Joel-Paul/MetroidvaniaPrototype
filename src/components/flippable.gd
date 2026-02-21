@tool
class_name Flippable
extends Node2D
## Allows children and nodes in [member flippable] to be flipped all at once by setting [member flip].

@export var flippable: Array[Node2D]
@export var flip := false:
	set(value):
		flip = value
		scale.x = get_facing()
		for node2d in flippable:
			node2d.scale.x = scale.x

func get_facing() -> int:
	return -1 if flip else 1
