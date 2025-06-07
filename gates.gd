extends CharacterBody2D

func _ready() -> void:
	if State.quest1 == true:
		queue_free()

func _on_actionables_body_entered(body: Node2D) -> void:
	if body.is_in_group("player") or body.name == "Player":
		if State.quest1 == true:
			queue_free()
