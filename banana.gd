extends Area2D

func _ready():
	$AnimationPlayer.play("float")

func _on_body_entered(body):
	if body.is_in_group("player") or body.name == "Player":
		if body.has_method("collect_banana"):
			body.collect_banana()
			# Play collect animation
			$AnimationPlayer.play("collect")
			# Wait for animation to finish
			await $AnimationPlayer.animation_finished
			queue_free()
