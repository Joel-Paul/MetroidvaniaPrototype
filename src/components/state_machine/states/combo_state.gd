class_name ComboState
extends State

@export var action: ActionBuffer
@export var attack: Attack
@export var movement: Movement
@export var combo_animations: Array[StringName]
@export var combo_timer: Timer

var animation_index = 0

func _ready() -> void:
	combo_timer.timeout.connect(func(): animation_index = 0)
	combo_animations.push_front(animation_name)

func can_enter(_prev_state: State) -> bool:
	return action.is_active() and entity.is_on_floor()

func enter(_prev_state: State) -> void:
	entity.set_attack(attack)
	action.stop()
	combo_timer.paused = true
	
	animation_player.play(combo_animations[animation_index])

func exit(next_state: State) -> void:
	combo_timer.paused = false
	combo_timer.start()
	animation_index = (animation_index + 1) % combo_animations.size()
	super(next_state)

func can_exit(next_state: State) -> bool:
	if next_state is IdleState:
		return not animation_player.is_playing()
	return super(next_state)

func update(delta: float) -> State:
	movement.update(delta)
	return super(delta)
