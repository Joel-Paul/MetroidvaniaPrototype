class_name StateMachine
extends State

signal switched_state(old: State, new: State)

var curr: State
var dirty: bool = false

func init(character_body2d: CharacterBody2D, animation_player: AnimationPlayer) -> void:
	super(character_body2d, animation_player)
	switch(self.next_states.get(0))

func update(delta: float) -> void:
	while true:
		super(delta)
		if not curr:
			return
		curr.update(delta)
		var next := curr.get_next()
		switch(next)
		
		if not dirty:
			break
		dirty = false

func switch(next: State) -> void:
	if not next or curr == next:
		return
	if curr:
		curr.exit(next)
		curr.active = false
	next.active = true
	next.enter(curr)
	switched_state.emit(curr, next)
	curr = next
