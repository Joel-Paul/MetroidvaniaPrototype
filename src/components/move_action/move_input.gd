extends MoveAction

func _physics_process(_delta: float) -> void:
	x = Input.get_axis("left", "right")
