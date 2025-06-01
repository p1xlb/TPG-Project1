extends Area2D

func _ready() -> void:
	$AnimationPlayer.play("float_c")

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player") or body.name == "Player":
		State.canting_found = true
		print(State.canting_found)
		queue_free()
