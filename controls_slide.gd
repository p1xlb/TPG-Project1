extends Node2D

func _ready() -> void:
	await $AnimationPlayer.animation_finished
	get_tree().change_scene_to_file("res://Transition1.tscn")
