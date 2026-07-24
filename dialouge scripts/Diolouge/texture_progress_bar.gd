extends TextureProgressBar

@onready var timer = $Timer
@export var response_menu: Control
var first_run = true
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var dialogue_line: DialogueLine = null
	var parent_node = get_parent()
	if is_instance_valid(parent_node):
		dialogue_line = parent_node.get("dialogue_line")
	if dialogue_line == null:
		dialogue_line = await DialogueManager.get_next_dialogue_line(Globals.CurrentScene, "start")
	print(first_run)
	print(dialogue_line)
	if dialogue_line.responses.size() > 0:
		if timer.is_stopped() and first_run:
			timer.start(3)
		elif first_run:
			$".".value = timer.time_left * 100
	if !first_run:
		if Input.is_action_just_pressed("ui_accept"):
			first_run = true	
			print("First run on")
	
func _on_timer_timeout() -> void:
	var dialogue_line: DialogueLine = null
	var parent_node = get_parent()
	if is_instance_valid(parent_node):
		dialogue_line = parent_node.get("dialogue_line")
	if dialogue_line == null:
		dialogue_line = await DialogueManager.get_next_dialogue_line(Globals.CurrentScene, "start")
	if dialogue_line.responses.size() > 0 and first_run:
		var random_index: int = randi() % dialogue_line.responses.size()
		var random_option = dialogue_line.responses[random_index]
		get_parent().goNext(random_option)
		first_run = false
		print("First run off")
