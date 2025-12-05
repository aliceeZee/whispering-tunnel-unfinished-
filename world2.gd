extends Area2D

@onready var entered = false

func _on_body_entered(_body: Node) -> void:
	entered = true

func _on_body_exited(_body: Node) -> void:
	entered = false

func _process(_delta: float) -> void:
	if entered and Input.is_action_just_pressed("enter"):
		get_tree().change_scene_to_file("res://assests/Scene/game.tscn")
