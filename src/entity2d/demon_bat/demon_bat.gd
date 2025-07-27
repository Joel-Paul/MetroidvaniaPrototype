@tool
extends Entity2D

@onready var health_component: Health = $HealthComponent

func _ready() -> void:
	if Engine.is_editor_hint(): return
	health_component.health_changed.connect(_on_health_changed)
	super()

func _physics_process(delta: float) -> void:
	if Engine.is_editor_hint(): return
	super(delta)

func _on_health_changed(health: int) -> void:
	if health <= 0:
		queue_free()
