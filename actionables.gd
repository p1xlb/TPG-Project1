extends Area2D

const Balloon = preload("res://dialogs/balloon.tscn")

@export var dialog_resource: DialogueResource
@export var dialog_start: String = "start" 

func action() -> void:
	var balloon: Node = Balloon.instantiate()
	get_tree().current_scene.add_child(balloon)
	balloon.start(dialog_resource, dialog_start)
