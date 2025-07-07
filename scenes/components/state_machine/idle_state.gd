extends State

func can_enter(_prev_state: State) -> bool:
	return character.is_on_floor() and character.velocity.x == 0

func enter(_prev_state: State) -> void:
	animation_player.play("idle")
