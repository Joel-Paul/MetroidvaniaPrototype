class_name HeavyComboState
extends ComboState

func can_exit(_next_state: State) -> bool:
	return not animation_player.is_playing()
