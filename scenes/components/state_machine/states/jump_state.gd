extends State

@export var jump_action: ActionBuffer
@export var jump: float = 300

func can_enter(_prev_state: State) -> bool:
	return character.is_on_floor() and jump_action.is_active()

func enter(_prev_state: State) -> void:
	animation_player.play("jump")
	character.velocity.y = -jump
