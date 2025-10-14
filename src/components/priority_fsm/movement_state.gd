class_name MovementState
extends State

@export var move_stats: MoveStats = MoveStats.new()

var moveable: Moveable
var flippable: Flippable

func init(character_body2d: CharacterBody2D, animation_player: AnimationPlayer) -> void:
	if _init:
		return
	for state in self.next_states:
		if state is MovementState:
			var movement := state as MovementState
			movement.moveable = moveable
			movement.flippable = flippable
	super(character_body2d, animation_player)

func update(delta: float) -> void:
	moveable.update(move_stats, delta)
