extends Button

func _on_button_up() -> void:
	$AnimationPlayer.play("transition end")
	await $AnimationPlayer.animation_finished
	State.player_health = 3
	get_tree().change_scene_to_file("res://splash_intro.tscn")
