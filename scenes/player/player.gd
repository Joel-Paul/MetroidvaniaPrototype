class_name Player
extends CharacterBody2D

func _ready() -> void:
	$StateMachine.init()

func _physics_process(delta: float) -> void:
	$StateMachine.update(delta)
	move_and_slide()

func _on_controller_flip(input: float) -> void:
	flip(input)

func flip(input: float):
	if input == 0: return
	var scale_x := signf(input)
	%CollisionShape2D.scale.x = scale_x
	%Sprite2D.scale.x = scale_x
