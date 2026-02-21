extends AttackState

@export var bite_range: Area2D
@export var player_raycast: RayCast2D
@export_range(0, 5, 0.01, "or_greater", "suffix:s") var cooldown: float = 1

@onready var player: CharacterBody2D = Global.get_player()
@onready var cooldown_timer: Timer = Global.create_timer(self)

func priority() -> float:
	if active and anim_player.is_playing():
		return base_priority
	if not active and in_bite_range() and cooldown_timer.is_stopped():
		return base_priority * 1.1
	return 0

func exit(next: State) -> void:
	super(next)
	cooldown_timer.start(cooldown)

func in_bite_range() -> bool:
	player_raycast.target_position = player.global_position - body2d.global_position
	return bite_range.has_overlapping_areas() and player_raycast.get_collider() is Hurtbox
