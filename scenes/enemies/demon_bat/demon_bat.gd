extends CharacterBody2D

func _ready() -> void:
	%StateMachine.init()

func _physics_process(delta: float) -> void:
	#%MoveAction.move_input = randf_range(-1, 1)
	%StateMachine.update(delta)
