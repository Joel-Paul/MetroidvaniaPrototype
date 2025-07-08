extends State

@export var speed: float = 150
@export var acceleration: float = 20
@export var deceleration: float = 15

func can_enter(_prev_state: State) -> bool:
	return character.is_on_floor() and (character.velocity.x != 0 or Input.get_axis("left", "right"))

func update(delta: float) -> State:
	controller.process_movement(speed, acceleration, deceleration, delta)
	return super(delta)
