class_name StateMachine
extends State
## A state machine which manages running and transitioning between [State]s.
##
## [StateMachine] itself is a [State] and can therefore be part of a larger state machine.

signal switched_state(old: State, new: State)

var curr: State
## Forces [method update] to run another loop.
var dirty: bool = false

func init(animation_player: AnimationPlayer) -> void:
	super(animation_player)
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
