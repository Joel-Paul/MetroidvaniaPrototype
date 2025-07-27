extends State

@export var movement: Movement
@export var navigation: NavigationAgent2D

@onready var _nav_update: Timer = _create_timer(false)

func _ready() -> void:
	_nav_update.timeout.connect(_target_player)

func can_enter(_prev_state: State) -> bool:
	return true

func enter(prev_state: State) -> void:
	_target_player()
	_nav_update.start(0.5)
	super(prev_state)

func exit(_new_state: State) -> void:
	_nav_update.stop()

func update(delta: float) -> State:
	movement.update(delta)
	return super(delta)

func _target_player() -> void:
	var _player = Global.get_player()
	if _player:
		navigation.target_position = _player.global_position
		if not navigation.is_target_reached() and navigation.is_target_reachable():
			var target: Vector2 = navigation.get_next_path_position()
			entity.input = entity.global_position.direction_to(target)
