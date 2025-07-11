class_name Player
extends CharacterBody2D

func _ready() -> void:
	$StateMachine.init()

func _physics_process(delta: float) -> void:
	if is_on_floor():
		%CoyoteTimer.start()
	$StateMachine.update(delta)
	move_and_slide()

func move_facing(vel: Vector2) -> void:
	velocity.x = vel.x * %FlipComponent.direction
	velocity.y = vel.y
