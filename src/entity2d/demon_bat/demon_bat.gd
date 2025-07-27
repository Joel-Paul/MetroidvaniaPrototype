@tool
extends Entity2D

@onready var health_component: Health = $HealthComponent
@onready var hit_state: Node = $StateMachine/HitState

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
	else:
		state_machine.change_state(hit_state)
