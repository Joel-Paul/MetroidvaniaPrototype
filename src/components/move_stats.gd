class_name MoveStats
extends Resource

@export_range(0, 1000, 1.0, "or_greater", "suffix:px/s") var speed: float = 0
@export_range(0, 1000, 1.0, "or_greater", "suffix:px/s²") var acceleration: float = 0
@export_range(0, 1000, 1.0, "or_greater", "suffix:px/s²") var deceleration: float = 0
