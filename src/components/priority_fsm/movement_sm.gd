class_name MovementSM
extends StateMachine
## State machine specialised in managing [MovementState] states.

@export var moveable: Moveable
@export var flippable: Flippable

func init(animation_player: AnimationPlayer) -> void:
	if _init:
		return
	for state in self.next_states:
		if state is MovementState:
			var movement := state as MovementState
			movement.moveable = moveable
			movement.flippable = flippable
	super(animation_player)
