extends CharacterBody2D

@onready var anim_player := %AnimationPlayer

@onready var moveable: Moveable = %Moveable
@onready var movement_sm: MovementSM = %MovementSM
@onready var coyote_timer: Timer = %CoyoteTimer
@onready var health: Health = %Health

func _ready() -> void:
	movement_sm.init(anim_player)

func _physics_process(delta: float) -> void:
	if is_on_floor():
		coyote_timer.start()
	
	# Character movement is handled in [Movement], but we need to respond to physics with [CharacterBody2D].
	velocity = moveable.velocity
	move_and_slide()
	moveable.velocity = velocity
	
	# Movement according to input (left/right) and gravity (down).
	var input := 0.0 if health.is_dead() else Input.get_axis("left", "right")
	moveable.direction = input * Vector2.RIGHT + Vector2.DOWN
	movement_sm.update(delta)
