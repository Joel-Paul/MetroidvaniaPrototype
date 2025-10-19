extends MovementState

@export var parent: StateMachine
@export var action: Action
@export_range(0, 1, 0.1, "or_greater", "suffix:s") var reset_time: float = 0

var index: int = 0

@onready var timer: Timer = Global.create_timer(self)

func _ready() -> void:
	timer.timeout.connect(_timeout)

func priority() -> float:
	if action.is_active():
		return base_priority
	return 0

func enter(_prev: State) -> void:
	timer.start(reset_time)
	parent.dirty = true
	action.intercept()

func get_next() -> State:
	var curr: State = self.next_states[index]
	index = (index + 1) % self.next_states.size()
	return curr

func _timeout() -> void:
	index = 0
	print("TA")
