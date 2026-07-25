extends Node2D
@export_category("Diolouges")
@export var house = Resource
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Globals.CurrentScene = house
	await get_tree().create_timer(1.0).timeout
	DialogueManager.show_dialogue_balloon(Globals.CurrentScene, "house")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
