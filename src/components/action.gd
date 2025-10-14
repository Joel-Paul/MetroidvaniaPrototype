class_name Action
extends Node

@export var action_name: StringName
@export_range(1.0/60, 5, 0.1, "or_greater", "suffix:s") var buffer: float = 1.0/60

@onready var timer := Global.create_timer(self)

func _physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed(action_name):
		timer.start(buffer)

func is_active() -> bool:
	return not timer.is_stopped()

func is_pressed() -> bool:
	return Input.is_action_pressed(action_name)
