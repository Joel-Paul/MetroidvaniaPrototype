class_name DemonBatProjectile
extends Area2D

var velocity: Vector2

@onready var anim_player: AnimationPlayer = %AnimationPlayer
@onready var hitbox: Hitbox = %Hitbox

func _ready() -> void:
	area_entered.connect(explode)
	body_entered.connect(explode)
	hitbox.area_entered.connect(explode)

func _physics_process(delta: float) -> void:
	if velocity:
		position += velocity * delta

func shoot(vel: Vector2) -> void:
	velocity = vel
	rotation = vel.angle()
	anim_player.play("idle")

func explode(_node2d: Node2D) -> void:
	velocity = Vector2.ZERO
	anim_player.play("explode")
	anim_player.animation_finished.connect(func(_anim_name: StringName):
		queue_free()
	)
