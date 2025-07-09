class_name ComboStates
extends State

@export var attack_component: AttackComponent
@export var combo_animations: Array[StringName]
@export var combo_delay_timer: float = 2
@export var deceleration: float = 10

var combo_delay: Timer = Timer.new()
var animation_index = 0

func _ready() -> void:
	combo_animations.push_front(animation_name)
	
	add_child(combo_delay)
	combo_delay.process_callback = Timer.TIMER_PROCESS_PHYSICS
	combo_delay.one_shot = true
	combo_delay.timeout.connect(func(): animation_index = 0)

func can_enter(_prev_state: State) -> bool:
	return attack_component.attack_requested()

func enter(_prev_state: State) -> void:
	controller.process_flip()
	attack_component.reset_buffer()
	combo_delay.start(combo_delay_timer)
	
	animation_player.play(combo_animations[animation_index])
	animation_index = (animation_index + 1) % combo_animations.size()

func can_exit(next_state: State) -> bool:
	if next_state is IdleState:
		return not animation_player.is_playing()
	return super(next_state)

func update(delta: float) -> State:
	controller.process_movement(0, deceleration, deceleration, delta, false)
	return super(delta)
