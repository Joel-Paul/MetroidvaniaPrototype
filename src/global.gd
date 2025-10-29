extends Node

func get_player() -> CharacterBody2D:
	return get_tree().get_first_node_in_group("player")

func create_timer(parent: Node = self, one_shot: bool = true) -> Timer:
	var timer = Timer.new()
	parent.add_child(timer)
	timer.process_callback = Timer.TIMER_PROCESS_PHYSICS
	timer.one_shot = one_shot
	return timer
