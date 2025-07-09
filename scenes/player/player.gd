class_name Player
extends CharacterBody2D

func _ready() -> void:
	$StateMachine.init()

func _physics_process(delta: float) -> void:
	process_inputs()
	$StateMachine.update(delta)
	move_and_slide()

func process_inputs() -> void:
	if Input.is_action_just_pressed("attack"): %AttackComponent.request_attack()
	if Input.is_action_just_pressed("heavy_attack"): %HeavyAttackComponent.request_attack()

func flip(input: float):
	if input == 0: return
	var scale_x := signf(input)
	%CollisionShape2D.scale.x = scale_x
	%Sprite2D.scale.x = scale_x
	%Hurtbox.scale.x = scale_x

func _on_controller_flip(input: float) -> void:
	flip(input)
