class_name ComboState
extends State

@export var action: ActionBuffer
@export var platformer_movement: PlatformerMovement
@export var combo_animations: Array[StringName]
@export var combo_delay_timer: float = 2

var combo_delay: Timer = Timer.new()
var animation_index = 0

func _ready() -> void:
	combo_animations.push_front(animation_name)
	
	add_child(combo_delay)
	combo_delay.process_callback = Timer.TIMER_PROCESS_PHYSICS
	combo_delay.one_shot = true
	combo_delay.timeout.connect(func(): animation_index = 0)

func can_enter(_prev_state: State) -> bool:
	return action.is_active()

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
	platformer_movement.update(delta)
	return super(delta)
