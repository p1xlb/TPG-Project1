extends CharacterBody2D


func _on_actionables_body_entered(body: Node2D) -> void:
	if body.is_in_group("player") or body.name == "Player":
		print("body entered")
		if State.canting_found == true:
			if $CollisionShape2D:
				$CollisionShape2D.queue_free()
