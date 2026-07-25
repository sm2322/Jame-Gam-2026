extends TextureProgressBar

@onready var timer = $Timer
@export var response_menu: Control
@export var length = 3.0
var first_run = true
var _waiting_for_typing: bool = false
var _last_dialogue_id: String = ""

func _ready() -> void:
	var dialogue_label = _get_dialogue_label()
	if is_instance_valid(dialogue_label):
		dialogue_label.finished_typing.connect(_on_dialogue_finished_typing)


func _process(_delta: float) -> void:
	var dialogue_line = _get_dialogue_line()
	if dialogue_line == null:
		return

	if dialogue_line.id != _last_dialogue_id:
		_reset_for_new_dialogue_line(dialogue_line.id)

	if dialogue_line.responses.size() == 0:
		if not timer.is_stopped():
			timer.stop()
		value = 100.0
		return

	var dialogue_label = _get_dialogue_label()
	if timer.is_stopped() and first_run:
		if is_instance_valid(dialogue_label) and dialogue_label.is_typing:
			_waiting_for_typing = true
			return

		_waiting_for_typing = false
		timer.start(length)
		value = 100.0
	elif not timer.is_stopped() and first_run:
		value = timer.time_left * 100

	if !first_run and Input.is_action_just_pressed("ui_accept"):
		first_run = true


func _on_dialogue_finished_typing() -> void:
	_waiting_for_typing = false
	if first_run and timer.is_stopped():
		timer.start(length)
		value = 100.0


func _reset_for_new_dialogue_line(dialogue_id: String) -> void:
	_last_dialogue_id = dialogue_id
	first_run = true
	_waiting_for_typing = false
	if not timer.is_stopped():
		timer.stop()
	value = 100.0


func _get_dialogue_line():
	var parent_node = get_parent()
	if is_instance_valid(parent_node):
		var dialogue_line = parent_node.get("dialogue_line")
		if dialogue_line != null:
			return dialogue_line
	return null


func _get_dialogue_label():
	var parent_node = get_parent()
	if is_instance_valid(parent_node):
		var dialogue_label = parent_node.get("dialogue_label")
		if is_instance_valid(dialogue_label):
			return dialogue_label
	return null


func _on_timer_timeout() -> void:
	var dialogue_line = _get_dialogue_line()
	if dialogue_line == null:
		return
	if dialogue_line.responses.size() > 0 and first_run:
		var random_index: int = randi() % dialogue_line.responses.size()
		var random_option = dialogue_line.responses[random_index]
		get_parent().goNext(random_option)
		first_run = false
		value = 0.0
