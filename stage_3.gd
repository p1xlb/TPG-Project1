extends Node2D

func _ready() -> void:
	add_to_group("stage3")

	
	$Canting.visible = false
	$Canting.get_node("CollisionShape2D").set_deferred("disabled", true)
	
	$Player.set_physics_process(false)
	await $Bus/AnimationPlayer.animation_finished
	$Bus.queue_free()
	$Player.set_physics_process(true)
	
func spawn_canting():
	$Canting.visible = true
	$Canting.get_node("CollisionShape2D").set_deferred("disabled", false)
