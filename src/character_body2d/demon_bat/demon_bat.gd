extends CharacterBody2D

@onready var anim_player: AnimationPlayer = %AnimationPlayer
@onready var moveable: Moveable = %Moveable
@onready var movement_sm: MovementSM = %MovementSM
@onready var health: Health = %Health

func _ready() -> void:
	movement_sm.init(anim_player)
	health.health_changed.connect(_die.unbind(1))

func _physics_process(delta: float) -> void:
	velocity = moveable.velocity
	move_and_slide()
	moveable.velocity = velocity
	
	movement_sm.update(delta)

func _die() -> void:
	if health.cur_health <= 0:
		queue_free()
