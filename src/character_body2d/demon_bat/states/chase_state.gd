extends MovementState

@export var nav_agent: NavigationAgent2D
@export_range(0, 5, 0.01, "or_greater", "suffix:s") var nav_update_interval: float = 0.5

@onready var player: CharacterBody2D = Global.get_player()
@onready var nav_timer: Timer = Global.create_timer(self, false)

func _ready() -> void:
	nav_timer.timeout.connect(_update_target)
	nav_timer.start(nav_update_interval)

func priority() -> float:
	if player:
		return base_priority
	return 0

func _update_target() -> void:
	if not player: return
	
	nav_agent.target_position = player.global_position
	if not nav_agent.is_navigation_finished() and nav_agent.is_target_reachable():
		moveable.direction = body2d.global_position.direction_to(nav_agent.get_next_path_position())
