class_name MoveStats
extends Resource

@export_custom(PROPERTY_HINT_LINK, "suffix:px/s") var speed := Vector2.ZERO
@export_custom(PROPERTY_HINT_LINK, "suffix:px/s²") var acceleration := Vector2.ZERO
@export_custom(PROPERTY_HINT_LINK, "suffix:px/s²") var deceleration := Vector2.ZERO
@export_custom(PROPERTY_HINT_NONE, "suffix:px/s²") var gravity := 980 * Vector2.DOWN
