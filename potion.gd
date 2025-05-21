extends Area2D

func _ready():
	$AnimationPlayer.play("float_p")

func _on_body_entered(body):
	if body.is_in_group("player") or body.name == "Player":
		State.potion = true
		queue_free()
