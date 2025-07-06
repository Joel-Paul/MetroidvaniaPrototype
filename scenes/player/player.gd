class_name Player
extends CharacterBody2D

@export var jump := 400.0
@export var speed := 150.0
@export var acceleration := 20.0
@export var friction := 20.0

func _ready() -> void:
	%StateMachine.init(self, %AnimationPlayer)
	%StateMachine.change_state()

func _physics_process(delta: float) -> void:
	flip()
	%StateMachine.physics_process(delta)
	move_and_slide()

func flip():
	var direction := Input.get_axis("left", "right")
	if direction == 0: return
	var scale_x = sign(direction)
	%CollisionShape2D.scale.x = scale_x
	%Sprite2D.scale.x = scale_x
