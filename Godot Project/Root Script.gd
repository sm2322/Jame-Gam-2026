extends Node2D

@export_category("Diolouges")
@export var enterCavePath = Resource
@export var VillagersPath = Resource
@export var OldLadyPath = Resource
@export var ClockPath = Resource
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
#func _unhandled_input(event: InputEvent) -> void:
	#if Input.is_action_just_pressed("triggerDiolouge"):
		#DialogueManager.show_dialogue_balloon(Globals.CurrentScene, "start")
		
func _on_enterer_body_entered(body: Node2D) -> void:
	if body.name == "CharacterBody2D":	
		Globals.CurrentScene = enterCavePath
		DialogueManager.show_dialogue_balloon(Globals.CurrentScene, "start")


func _on_villagers_body_entered(body: Node2D) -> void:
	if body.name == "CharacterBody2D":	
		Globals.CurrentScene = VillagersPath
		DialogueManager.show_dialogue_balloon(Globals.CurrentScene, "start")


func _on_old_lady_body_entered(body: Node2D) -> void:
	if body.name == "CharacterBody2D":	
		Globals.CurrentScene = OldLadyPath
		DialogueManager.show_dialogue_balloon(Globals.CurrentScene, "start")


func _on_old_lady_2_body_entered(body: Node2D) -> void:
	if body.name == "CharacterBody2D":	
		Globals.CurrentScene = ClockPath
		DialogueManager.show_dialogue_balloon(Globals.CurrentScene, "start")
