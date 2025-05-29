extends Node

func _ready() -> void:
	await $VideoStreamPlayer.finished
	get_tree().change_scene_to_file("res://controls.tscn")

func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().change_scene_to_file("res://controls.tscn")
