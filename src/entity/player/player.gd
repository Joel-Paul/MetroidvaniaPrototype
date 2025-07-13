@tool
class_name Player
extends Entity2D

@onready var coyote_timer: Timer = %CoyoteTimer

func _physics_process(delta: float) -> void:
	if Engine.is_editor_hint(): return
	if is_on_floor():
		coyote_timer.start()
	input.x = Input.get_axis("left", "right")
	super(delta)
