extends Area2D

@export var next_stage = ""

func _ready() -> void:
	pass

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		State.reset_stage_banana()
		body.set_physics_process(false)
		body.visible = false
		await get_tree().create_timer(1.0).timeout
		get_tree().change_scene_to_file(next_stage)
