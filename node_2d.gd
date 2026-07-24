#gulp this is like super simple but its for the aurabar (ignore the print statements that was for debugging)

extends Node2D

var aura_frame := 0
var max_frame := 11

@onready var aura_bar = $AuraBar

func _on_increase_aura_button_pressed():
	print("aura increased!")
	aura_frame += 1
	aura_frame = clamp(aura_frame, 0, max_frame)
	aura_bar.frame = aura_frame


func _on_decrease_aura_button_pressed():
	print("aura decreased!")
	aura_frame -= 2
	aura_frame = clamp(aura_frame, 0, max_frame)
	aura_bar.frame = aura_frame
