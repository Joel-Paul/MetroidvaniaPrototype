extends State

@export var jump: float = 300

func can_enter(_prev_state: State) -> bool:
	return controller.can_jump()

func enter(_prev_state: State) -> void:
	animation_player.play("jump")
	character.velocity.y = -jump
