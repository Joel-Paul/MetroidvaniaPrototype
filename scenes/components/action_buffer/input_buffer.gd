extends ActionBuffer

@export var action: StringName

func _physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed(action):
		start()
