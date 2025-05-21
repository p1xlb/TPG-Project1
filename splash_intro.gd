extends Node

func _ready() -> void:
	await $VideoStreamPlayer.finished
	get_tree().change_scene_to_file("res://startmenu.tscn")
