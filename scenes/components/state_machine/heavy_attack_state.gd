extends ComboStates

func can_enter(_prev_state: State) -> bool:
	return attack_component.can_heavy_attack()
