class_name Hitbox
extends Area2D

var attack: Attack

func _ready() -> void:
	area_entered.connect(_on_area_entered)

func _on_area_entered(hurtbox: Hurtbox) -> void:
	hurtbox.hurt(attack)
