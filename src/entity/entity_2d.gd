@tool
class_name Entity2D
extends CharacterBody2D

#region @export variables
@export var state_machine: StateMachine:
	set(value):
		state_machine = value
		if Engine.is_editor_hint(): update_configuration_warnings()

@export_group("Horizontal Flipping")
@export var flippable: Array[Node2D]
@export var _test_flip: bool = false:
	set(value):
		_test_flip = value
		flip(0.5 - float(value))
#endregion

var input: Vector2 = Vector2.ZERO
var _facing: int = 1

#region virtual methods
func _ready() -> void:
	print(self.name)
	if Engine.is_editor_hint(): return
	state_machine.init()
	flip(1)

func _physics_process(delta: float) -> void:
	if Engine.is_editor_hint(): return
	state_machine.update(delta)
	move_and_slide()

func _get_configuration_warnings() -> PackedStringArray:
	if not state_machine:
		return ["A StateMachine is required for Entity2D to function!"]
	return []
#endregion

func has_input() -> bool:
	return input != Vector2.ZERO

func flip(value: float = input.x) -> void:
	if not value: return  # Keep the current _facing direction if value == 0
	_facing = int(signf(value))
	for node in flippable:
		node.scale.x = _facing

func move_facing(vel: Vector2) -> void:
	velocity.x = vel.x * _facing
	velocity.y = vel.y
