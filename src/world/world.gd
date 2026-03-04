extends Node2D

@onready var player: Player = %Player
@onready var hud = %HUD

func _ready() -> void:
	player.health_changed.connect(_set_health.unbind(1))
	_set_health()

func _physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()
	if Input.is_action_just_pressed("restart"):
		get_tree().reload_current_scene()

func _set_health() -> void:
	hud.set_health(player.health.cur_health)
