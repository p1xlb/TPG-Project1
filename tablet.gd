extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player") or body.name == "Player":
		State.tablet_found = true
		print(State.tablet_found)
		queue_free()
