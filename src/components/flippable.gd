@tool
class_name Flippable
extends Node2D

@export var flippable: Array[Node2D]
@export var flip := false:
	set(value):
		flip = value
		scale.x = -1 if flip else 1
		for node2d in flippable:
			node2d.scale.x = -1 if flip else 1

func get_facing() -> int:
	return -1 if flip else 1
