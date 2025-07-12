class_name ComboState
extends State

@export var action: ActionBuffer
@export var movement: Movement
@export var combo_animations: Array[StringName]
@export var combo_delay_timer: float = 2

@onready var combo_delay: Timer = _create_timer()

var animation_index = 0

func _ready() -> void:
	combo_delay.timeout.connect(func(): animation_index = 0)
	combo_animations.push_front(animation_name)

func can_enter(_prev_state: State) -> bool:
	return action.is_active() and character.is_on_floor()

func enter(_prev_state: State) -> void:
	action.stop()
	combo_delay.start(combo_delay_timer)
	
	animation_player.play(combo_animations[animation_index])
	animation_index = (animation_index + 1) % combo_animations.size()

func can_exit(next_state: State) -> bool:
	if next_state is IdleState:
		return not animation_player.is_playing()
	return super(next_state)

func update(delta: float) -> State:
	movement.update(delta)
	return super(delta)
