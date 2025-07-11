class_name FlipComponent
extends Node

@export var nodes_to_flip: Array[Node2D]

func flip(input: float) -> void:
	if not input: return
	var direction = signi(int(input))
	for node in nodes_to_flip:
		node.scale.x = direction
