extends MoveAction

func _physics_process(_delta: float) -> void:
	move_input = Input.get_axis("left", "right")
