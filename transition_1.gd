extends Node2D

@export var next_stage = ""

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await $AnimationPlayer.animation_finished
	get_tree().change_scene_to_file(next_stage)
