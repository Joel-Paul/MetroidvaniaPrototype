extends CharacterBody2D

func _ready() -> void:
	%StateMachine.init()

func _physics_process(delta: float) -> void:
	%StateMachine.update(delta)
	move_and_slide()
