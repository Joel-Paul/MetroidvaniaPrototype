extends State

@export var speed: float = 150
@export var acceleration: float = 20
@export var deceleration: float = 15
@export var gravity: float = 980

func can_enter(_prev_state: State) -> bool:
	return not character.is_on_floor() and character.velocity.y < 0

func update(delta: float) -> State:
	controller.process_movement(speed, acceleration, deceleration, delta)
	controller.process_gravity(gravity, delta)
	return super(delta)
