class_name Action
extends Node
## Class that simplifies input buffering for player inputs.

## Name of the input action event.
@export var action_name: StringName
## Duration of the action buffer.
@export_range(1.0/60, 5, 0.1, "or_greater", "suffix:s") var buffer: float = 1.0/60

@onready var timer := Global.create_timer(self)

func _physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed(action_name):
		timer.start(buffer)

## Stop the action buffer.
func intercept() -> void:
	timer.stop()

## Is the action buffer still active?
func is_active() -> bool:
	return not timer.is_stopped()

## Is the key still pressed?
## May still be true even after the action buffer has expired.
func is_pressed() -> bool:
	return Input.is_action_pressed(action_name)
