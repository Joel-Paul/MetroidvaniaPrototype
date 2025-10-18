extends CharacterBody2D

@onready var player := %AnimationPlayer

@onready var moveable: Moveable = %Moveable
@onready var movement_sm: MovementSM = %MovementSM
@onready var coyote_timer: Timer = %CoyoteTimer

func _ready() -> void:
	movement_sm.init(self, player)

func _physics_process(delta: float) -> void:
	if is_on_floor():
		coyote_timer.start()
	
	velocity = moveable.velocity
	move_and_slide()
	moveable.velocity = velocity
	
	moveable.direction = Input.get_axis("left", "right") * Vector2.RIGHT
	movement_sm.update(delta)
	
