class_name FlipComponent
extends Node

@export var nodes_to_flip: Array[Node2D]
var direction: int = 1

func flip(input: float) -> void:
	if not input: return
	direction = signi(int(input))
	for node in nodes_to_flip:
		node.scale.x = direction
