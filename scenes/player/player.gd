class_name Player
extends CharacterBody2D

func _ready() -> void:
	$StateMachine.init()

func _physics_process(delta: float) -> void:
	process_inputs()
	$StateMachine.update(delta)
	move_and_slide()

func process_inputs() -> void:
	pass
