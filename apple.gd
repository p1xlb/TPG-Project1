extends Area2D

func _ready():
	$AnimationPlayer.play("float_a")

func _on_body_entered(body):
	if body.is_in_group("player") or body.name == "Player":
		State.apple = true
		queue_free()
