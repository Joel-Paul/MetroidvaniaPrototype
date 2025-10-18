extends Label


func _on_movement_sm_switched_state(_old: State, new: State) -> void:
	text = new.name
