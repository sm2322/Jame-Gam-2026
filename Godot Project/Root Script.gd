extends Node2D

@export_category("Diolouges")
@export var oldLadyPath = Resource
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Globals.CurrentScene = oldLadyPath


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("triggerDiolouge"):
		DialogueManager.show_dialogue_balloon(Globals.CurrentScene, "start")
		
