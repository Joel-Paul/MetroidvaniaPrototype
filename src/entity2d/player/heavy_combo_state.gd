class_name HeavyComboState
extends ComboState

func can_exit(_next_state: State) -> bool:
	return not animation_player.is_playing()

func exit(next_state: State) -> void:
	super(next_state)
	combo_timer.paused = true
