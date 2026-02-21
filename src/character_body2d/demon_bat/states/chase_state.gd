extends MovementState

@export var character: CharacterBody2D
@export var nav_agent: NavigationAgent2D
@export_range(0, 5, 0.01, "or_greater", "suffix:s") var nav_update_interval: float = 1

@onready var player: CharacterBody2D = Global.get_player()
@onready var nav_timer: Timer = Global.create_timer(self, false)

func _ready() -> void:
	_update_target()
	nav_timer.timeout.connect(_update_target)

func priority() -> float:
	if nav_agent.is_target_reached():
		return base_priority * 0.9
	if nav_agent.is_target_reachable():
		return base_priority
	return 0

func enter(_prev: State) -> void:
	nav_timer.start(nav_update_interval)
	anim_player.play("flying")
	_update_target()

func exit(_next: State) -> void:
	nav_timer.stop()

func _update_target() -> void:
	if not player: return
	
	nav_agent.target_position = player.global_position - Vector2(0, 2)
	if not nav_agent.is_navigation_finished() and nav_agent.is_target_reachable():
		moveable.direction = character.global_position.direction_to(nav_agent.get_next_path_position())
