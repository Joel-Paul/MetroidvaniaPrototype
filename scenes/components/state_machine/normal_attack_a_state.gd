extends State

@export var attack_component: AttackComponent
@export var lunge_speed: float = 100
@export var deceleration: float = 10

func can_enter(_prev_state: State) -> bool:
	return attack_component.can_attack()

func enter(_prev_state: State) -> void:
	controller.process_flip()
	animation_player.play("normal_combo_a")
	await get_tree().create_timer(0.3, true, true).timeout
	controller.move_facing(lunge_speed)

func can_exit(next_state: State) -> bool:
	if next_state is IdleState:
		return not animation_player.is_playing()
	return not attack_component.animation_locked

func update(delta: float) -> State:
	controller.process_movement(0, deceleration, deceleration, delta, false)
	return super(delta)
