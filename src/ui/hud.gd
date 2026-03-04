class_name HUD
extends CanvasLayer

const HP_TEXTURE: Texture2D = preload("uid://b8tnq4bu0rv2b")

@onready var health_bar: HBoxContainer = %HealthBar

func set_health(health: int) -> void:
	for c in health_bar.get_children():
		c.queue_free()
	
	for i in health:
		health_bar.add_child(_create_hp())

func _create_hp() -> TextureRect:
	var hp: TextureRect = TextureRect.new()
	hp.texture = HP_TEXTURE
	return hp
