extends AttackState

@export var bite_range: Area2D
@export var player_raycast: RayCast2D

@onready var player: CharacterBody2D = Global.get_player()

func priority() -> float:
	if active and anim_player.is_playing():
		return base_priority
	if not active and in_bite_range():
		return base_priority * 1.1
	return 0

func in_bite_range() -> bool:
	player_raycast.target_position = player.global_position - body2d.global_position
	return bite_range.has_overlapping_areas() and player_raycast.get_collider() is Hurtbox
