extends CharacterBody2D

func _ready() -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	await get_tree().create_timer(2.0).timeout
	get_tree().change_scene_to_file("res://Stage2.tscn")
