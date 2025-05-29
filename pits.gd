extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body.has_method("die") and body.name == "Player":
		body.take_damage()
		body.die()
