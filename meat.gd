extends Area2D

func _ready():
	$AnimationPlayer.play("float")

func _on_body_entered(body):
	if body.is_in_group("player") or body.name == "Player":
		State.meat = true
		print("meat collected")
		queue_free()
