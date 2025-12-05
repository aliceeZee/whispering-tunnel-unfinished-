extends Control

@onready var main_buttons: VBoxContainer = $MainButtons
@onready var options_settings: Panel = $options_settings



func _ready():
	main_buttons.visible = true
	options_settings.visible = false

func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://assests/Scene/game.tscn")

func _on_options_pressed() -> void:
	print("option pressed")
	main_buttons.visible = false
	options_settings.visible = true


func _on_credits_pressed() -> void:
	pass # Replace with function body.


func _on_back_pressed() -> void:
	_ready()
