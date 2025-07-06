class_name State
extends Node

var character: CharacterBody2D
var animation_player: AnimationPlayer

func init(character_body: CharacterBody2D, anim_player: AnimationPlayer) -> void:
	character = character_body
	animation_player = anim_player

func enter(_prev_state: State) -> void:
	pass

func exit() -> void:
	pass

func physics_process(_delta: float) -> State:
	return null
