extends Node

var CurrentScene = Resource
var running = true
var newPlayerPos = false
var pos = Vector2()
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func _goToCave():
	get_tree().change_scene_to_file("res://Cave.tscn")
func _goToHome():
	get_tree().change_scene_to_file("res://Game.tscn")
func _goToPostCave():
	get_tree().change_scene_to_file("res://Game.tscn")
	pos = Vector2(509.0,2598.0)
	newPlayerPos = true
func _goToHouse():
	get_tree().change_scene_to_file("res://House.tscn")
func _goToPostHouse():
	get_tree().change_scene_to_file("res://Game.tscn")
	pos = Vector2(743.0,2253.0)
	newPlayerPos = true
