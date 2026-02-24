extends Label

@export var state_machine: StateMachine

func _ready() -> void:
	state_machine.switched_state.connect(_on_movement_sm_switched_state)

func _on_movement_sm_switched_state(_old: State, new: State) -> void:
	text = new.name
