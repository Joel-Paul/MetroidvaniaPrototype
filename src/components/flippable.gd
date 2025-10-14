@tool
class_name Flippable
extends Node

@export var flippable: Array[Node2D]
@export var flip := false:
	set(value):
		flip = value
		for node2d in flippable:
			node2d.scale.x = -1 if flip else 1
