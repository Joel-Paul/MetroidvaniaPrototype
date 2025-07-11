extends State

@export var platformer_movement: PlatformerMovement
@export var move_action: MoveAction

func can_enter(_prev_state: State) -> bool:
	return character.is_on_floor() and (character.velocity.x != 0 or move_action.has_input())

func update(delta: float) -> State:
	platformer_movement.update(delta)
	return super(delta)
