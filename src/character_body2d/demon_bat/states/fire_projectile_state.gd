extends AttackState

const DEMON_BAT_PROJECTILE = preload("uid://cookyrw3rxaw6")

@export var shoot_range: Area2D
@export var projectile_marker: Marker2D
@export_range(0, 100, 1.0, "or_greater", "suffix:px/s") var projectile_speed: float = 60
@export_range(0, 5, 0.01, "or_greater", "suffix:s") var shoot_interval: float = 1

var projectile: DemonBatProjectile

@onready var player: CharacterBody2D = Global.get_player()
@onready var shoot_timer: Timer = Global.create_timer(self)

func priority() -> float:
	if active and anim_player.is_playing():
		return base_priority
	if not active and shoot_range.has_overlapping_areas() and shoot_timer.is_stopped():
		return base_priority * 1.1
	return 0

func charge_projectile() -> void:
	projectile = DEMON_BAT_PROJECTILE.instantiate()
	body2d.add_child(projectile)
	projectile.global_position = projectile_marker.global_position

func shoot_projectile() -> void:
	shoot_timer.start(shoot_interval)
	if not projectile:
		return
	var direction = projectile_marker.global_position.direction_to(player.position)
	if not direction:
		direction = Vector2.RIGHT
	var vel = direction * projectile_speed
	projectile.shoot(vel)
	projectile.reparent(body2d.get_parent())
