@tool
class_name FlipComponent
extends Node

@export var nodes_to_flip: Array[Node2D]
@export var test_flip: bool:
	set(value):
		test_flip = value
		var input = -1 if value else 1
		flip(input)
var direction: int = 1

func _ready() -> void:
	flip(1)

func flip(input: float) -> void:
	if not input: return
	direction = int(signf(input))
	for node in nodes_to_flip:
		node.scale.x = direction
