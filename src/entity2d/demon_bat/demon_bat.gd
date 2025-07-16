@tool
extends Entity2D

func _physics_process(delta: float) -> void:
	if Engine.is_editor_hint(): return
	super(delta)
