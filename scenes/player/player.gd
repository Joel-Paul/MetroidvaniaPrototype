class_name Player
extends CharacterBody2D

@export var jump := 400.0
@export var speed := 150.0
@export var acceleration := 20.0
@export var friction := 20.0

var direction := 0.0

func _physics_process(delta: float) -> void:
	player_input()
	velocity += get_gravity() * delta
	player_animations()
	move_and_slide()

func player_input():
	direction = Input.get_axis("left", "right")
	if direction == 0:
		velocity.x = move_toward(velocity.x, 0, friction)
	else:
		flip()
		velocity.x = move_toward(velocity.x, speed * direction, acceleration)
	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y -= jump
		%AnimationPlayer.play("jump")

func player_animations():
	if velocity.y > 0 and not is_on_floor():
		%AnimationPlayer.play("fall")
	if is_on_floor():
		if velocity.x == 0:
			%AnimationPlayer.play("idle")
		else:
			%AnimationPlayer.play("run")

func flip():
	var scale_x = -1 if direction < 0 else 1
	%CollisionShape2D.scale.x = scale_x
	%Sprite2D.scale.x = scale_x
