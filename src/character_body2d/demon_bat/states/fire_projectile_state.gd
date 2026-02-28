extends AttackState

const DEMON_BAT_PROJECTILE = preload("uid://cookyrw3rxaw6")

@export var shoot_enabled: Area2D
@export var shoot_disabled: Area2D
@export var player_raycast: RayCast2D
@export var projectile_marker: Marker2D
@export_range(0, 500, 1.0, "or_greater", "suffix:px/s") var projectile_speed: float = 60
@export_range(0, 5, 0.01, "or_greater", "suffix:s") var cooldown: float = 1

var projectile: DemonBatProjectile

@onready var player: CharacterBody2D = Global.get_player()
@onready var cooldown_timer: Timer = Global.create_timer(self)

func priority() -> float:
	if active and anim_player.is_playing():
		return base_priority
	if not active and in_shoot_range() and cooldown_timer.is_stopped():
		return base_priority
	return 0

func exit(next: State) -> void:
	super(next)
	cooldown_timer.start(cooldown)

func in_shoot_range() -> bool:
	if not player:
		return false
	player_raycast.target_position = player.global_position - player_raycast.global_position
	return shoot_enabled.has_overlapping_areas() \
		and not shoot_disabled.has_overlapping_areas() \
		and player_raycast.get_collider() is Hurtbox

func charge_projectile() -> void:
	projectile = DEMON_BAT_PROJECTILE.instantiate()
	projectile_marker.add_child(projectile)
	projectile.global_position = projectile_marker.global_position

func shoot_projectile() -> void:
	if not projectile or not player:
		return
	var direction = projectile_marker.global_position.direction_to(player.position)
	if not direction:
		direction = Vector2.RIGHT
	var vel = direction * projectile_speed
	projectile.reparent(self)
	projectile.shoot(vel)
