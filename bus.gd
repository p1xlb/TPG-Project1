extends Area2D

@export var next_stage = ""

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		State.reset_stage_banana()
		body.set_physics_process(false)
		body.visible = false
		$AnimationPlayer.play("van_drive_2")
		await $AnimationPlayer.animation_finished
		get_tree().change_scene_to_file(next_stage)
