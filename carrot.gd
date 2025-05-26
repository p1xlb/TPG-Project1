extends Area2D

func _ready():
	$AnimationPlayer.play("float_c")

func _on_body_entered(body):
	if body.is_in_group("player") or body.name == "Player":
		State.papers = State.papers + 1
		print(State.papers)
		queue_free()
