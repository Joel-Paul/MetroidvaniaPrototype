class_name StateMachine
extends State

var curr: State

func init(character_body2d: CharacterBody2D, animation_player: AnimationPlayer) -> void:
	super(character_body2d, animation_player)
	switch(self.next_states[0])

func update(delta: float) -> void:
	super(delta)
	if not curr:
		return
	curr.update(delta)
	var next := curr.get_next()
	switch(next)

func switch(next: State) -> void:
	if not next or curr == next:
		return
	if curr:
		curr.exit(next)
		curr.active = false
	next.enter(curr)
	next.active = true
	curr = next
