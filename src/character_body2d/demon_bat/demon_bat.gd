extends CharacterBody2D

@onready var anim_player: AnimationPlayer = %AnimationPlayer
@onready var moveable: Moveable = %Moveable
@onready var movement_sm: MovementSM = %MovementSM

func _ready() -> void:
	movement_sm.init(self, anim_player)

func _physics_process(delta: float) -> void:
	velocity = moveable.velocity
	move_and_slide()
	moveable.velocity = velocity
	
	movement_sm.update(delta)
