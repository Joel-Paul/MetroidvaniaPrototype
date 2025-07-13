class_name ActionBuffer
extends Timer

func is_active() -> bool:
	return not is_stopped()
